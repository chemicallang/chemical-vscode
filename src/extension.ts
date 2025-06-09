'use strict';

import * as net from "net"
import * as vscode from 'vscode';
import { Trace } from 'vscode-jsonrpc';
import { window, workspace, commands, ExtensionContext, Uri, TextDocument, languages, SemanticTokensLegend, CancellationToken, ProviderResult, SemanticTokens, TextDocumentChangeEvent } from 'vscode';
import { LanguageClient, LanguageClientOptions, StreamInfo, Position as LSPosition, Location as LSLocation, SemanticTokenTypes, SemanticTokenModifiers, TextDocumentIdentifier, SemanticTokensParams, DidChangeTextDocumentParams, DidOpenTextDocumentParams, DidCloseTextDocumentParams } from 'vscode-languageclient/node';
import * as fs from 'fs';
import { ChildProcess, ChildProcessWithoutNullStreams, exec, spawn } from 'child_process';
import * as os from 'os';
import * as path from 'path';
import * as extract from "extract-zip"
import * as https from "https"
import * as http from "http"
import { compareVersions, parseVersion } from "./version";
import { compileAndRunCommand, getConfiguredLspPath } from "./compileAndRun";

let lc: LanguageClient;

const tokenTypes = new Map<string, number>();
const tokenModifiers = new Map<string, number>();

const legend = (function () {
    const tokenTypesLegend = [
        SemanticTokenTypes.namespace,
        SemanticTokenTypes.type,
        SemanticTokenTypes.class,
        SemanticTokenTypes.enum,
        SemanticTokenTypes.interface,
        SemanticTokenTypes.struct,
        SemanticTokenTypes.typeParameter,
        SemanticTokenTypes.parameter,
        SemanticTokenTypes.variable,
        SemanticTokenTypes.property,
        SemanticTokenTypes.enumMember,
        SemanticTokenTypes.event,
        SemanticTokenTypes.function,
        SemanticTokenTypes.method,
        SemanticTokenTypes.macro,
        SemanticTokenTypes.keyword,
        SemanticTokenTypes.modifier,
        SemanticTokenTypes.comment,
        SemanticTokenTypes.string,
        SemanticTokenTypes.number,
        SemanticTokenTypes.regexp,
        SemanticTokenTypes.operator,
        SemanticTokenTypes.decorator,
        'label'
    ];
    tokenTypesLegend.forEach((tokenType, index) => tokenTypes.set(tokenType, index));

    const tokenModifiersLegend = [
        SemanticTokenModifiers.declaration,
        SemanticTokenModifiers.definition,
        SemanticTokenModifiers.readonly,
        SemanticTokenModifiers.static,
        SemanticTokenModifiers.deprecated,
        SemanticTokenModifiers.abstract,
        SemanticTokenModifiers.async,
        SemanticTokenModifiers.modification,
        SemanticTokenModifiers.documentation,
        SemanticTokenModifiers.defaultLibrary
    ];
    tokenModifiersLegend.forEach((tokenModifier, index) => tokenModifiers.set(tokenModifier, index));

    return new vscode.SemanticTokensLegend(tokenTypesLegend, tokenModifiersLegend);
})();

/**
 * Downloads a file from downloadUrl into binaryDir/assetName,
 * piping it to disk and reporting progress.
 */
function downloadZipReportProgress(
    downloadUrl: string,
    zipPath: string,
    progress: vscode.Progress<{ message: string; increment?: number }>
): Promise<void> {
    return new Promise((resolve, reject) => {
        const url = new URL(downloadUrl);
        const client = url.protocol === 'https:' ? https : http;

        const req = client.get(url, (res) => {
            const { statusCode, statusMessage, headers } = res;

            // Manually follow 3xx redirects
            if (statusCode && statusCode >= 300 && statusCode < 400 && headers.location) {
                // recurse to follow redirect
                return downloadZipReportProgress(headers.location, zipPath, progress)
                    .then(resolve)
                    .catch(reject);
            }

            if (!statusCode || statusCode < 200 || statusCode >= 300) {
                return reject(
                    new Error(`Failed to download asset: ${statusCode} ${statusMessage}`)
                );
            }

            const totalSize = Number(headers['content-length'] || '0');
            let downloaded = 0;
            const fileStream = fs.createWriteStream(zipPath);

            res.on('data', (chunk: Buffer) => {
                downloaded += chunk.length;
                const pct = totalSize
                    ? ((chunk.length / totalSize) * 100)
                    : undefined;
                progress.report({
                    message: `Downloaded ${(downloaded / 1024 / 1024).toFixed(2)} MB`,
                    increment: pct
                });
            });

            res.pipe(fileStream)
                .on('finish', () => resolve())
                .on('error', (err) => reject(err));
        });

        req.on('error', (err) => reject(err));
    });
}

async function downloadAndExtractLsp(
    title : string,
    downloadUrl: string,
    zipPath: string,
    extractedPath: string,
    marker: string
): Promise<void> {
    // Wrap download & extract in progress notification
    return vscode.window.withProgress({
        location: vscode.ProgressLocation.Notification,
        title: title,
        cancellable: false
    }, async (progress) => {

        return downloadZipReportProgress(downloadUrl, zipPath, progress).then(async () => {

            // Extract via system tar/unzip

            if (fs.existsSync(extractedPath)) {
                fs.rmdirSync(extractedPath);
                fs.mkdirSync(extractedPath)
            } else {
                fs.mkdirSync(extractedPath)
            }

            console.log("extracting downloaded package", zipPath)
            try {
                await extract(zipPath, { dir: extractedPath, })
            } catch (e) {
                return new Promise((resolve, reject) => reject(new Error("error extracting '" + e + "'")))
            }

            // Mark as ready
            fs.writeFile(marker, "", "utf8", () => { });

            progress.report({ message: 'Done extracting', increment: 100 });

        })

    });
}

/**
 * Fetches the releases array from GitHub’s API using Node’s native https module.
 */
function fetchReleases(
    repoOwner: string,
    repoName: string
): Promise<any[]> {
    return new Promise((resolve, reject) => {
        const options: https.RequestOptions = {
            hostname: 'api.github.com',
            path: `/repos/${repoOwner}/${repoName}/releases`,
            method: 'GET',
            headers: {
                'User-Agent': 'vscode-extension',             // GitHub requires a User-Agent header
                'Accept': 'application/vnd.github.v3+json'
            }
        };

        const req = https.request(options, (res) => {
            let rawData = '';
            res.on('data', (chunk) => {
                rawData += chunk;
            });
            res.on('end', () => {
                const { statusCode, statusMessage } = res;
                if (statusCode && statusCode >= 200 && statusCode < 300) {
                    try {
                        const releases = JSON.parse(rawData) as any[];
                        resolve(releases);
                    } catch (err) {
                        reject(new Error(`Invalid JSON response: ${err}`));
                    }
                } else {
                    reject(
                        new Error(
                            `Failed to fetch releases: ${statusCode} ${statusMessage}`
                        )
                    );
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });

        req.end();
    });
}

function getLspReleaseAssetName(): string | null {
    if (process.platform === 'win32') {
        return 'windows-x64-lsp';
    } else if (process.platform === 'linux') {
        return 'linux-x86-64-lsp';
    } else {
        return null
    }
}

async function getLspPkgDir(context: vscode.ExtensionContext): Promise<string | null> {

    // Prepare storage path
    const storageUri = context.globalStorageUri;
    const binaryDir = storageUri.fsPath;
    const extractedPath = path.join(binaryDir, 'lsp');

    // Determine asset name based on platform
    let assetName = getLspReleaseAssetName()
    if (assetName == null) {
        return new Promise((resolve, reject) => reject(new Error(`Unsupported platform: ${process.platform}`)))
    }

    // If already extracted, return path
    const marker = path.join(extractedPath, '.ready');
    if (fs.existsSync(marker)) {
        return path.join(extractedPath, assetName);
    }

    return null

}

function getReleaseAsset(rel: any, assetFileName: string) {
    const asset = rel.assets.find((a: any) => a.name === assetFileName);
    if (asset) {
        return asset.browser_download_url;
    } else {
        return null;
    }
}

const maxReleases = 5;
const repoOwner = 'chemicallang';
const repoName = 'chemical';

/**
 * Download and extract the LSP binary for the current OS (update)
 * Checks up to `maxReleases` most recent releases (including prereleases).
 */
async function downloadLspPackageUpdate(
    context: vscode.ExtensionContext,
    currVersion: string,
    considerNightly: boolean,
    considerAlphaBeta: boolean
): Promise<string | null> {

    // Determine asset name based on platform
    let assetName = getLspReleaseAssetName()
    if (assetName == null) {
        return new Promise((resolve, reject) => reject(new Error(`Unsupported platform: ${process.platform}`)))
    }

    console.log("Checking for updates, current version ", currVersion);

    // Prepare storage path
    const storageUri = context.globalStorageUri;
    const binaryDir = storageUri.fsPath;
    const extractedPath = path.join(binaryDir, 'lsp-update');

    // lets create directory for storing the lsp zip
    if (!fs.existsSync(binaryDir)) {
        fs.mkdirSync(binaryDir, { recursive: true });
    }

    // Fetch releases from GitHub API
    const releases = await fetchReleases(repoOwner, repoName)
    // console.log("fetched releases : ", releases)

    const currentVersion = parseVersion(currVersion)
    if (currentVersion == null) {
        console.error("couldn't parse current version", currVersion);
        return null;
    }

    let assetFileName = assetName + ".zip"

    //   // Find asset download URL
    let downloadUrl: string | undefined;
    for (let i = 0; i < Math.min(maxReleases, releases.length); i++) {
        const rel = releases[i];
        if (rel.name != null) {
            const newVersion = parseVersion(rel.name)
            if (newVersion.prerelease != null) {
                if (considerNightly && newVersion.prerelease == "nightly") {
                    const compareResult = compareVersions(newVersion, currentVersion)
                    if (compareResult == 1) {
                        // greater
                        const url = getReleaseAsset(rel, assetFileName)
                        if (url != null) {
                            downloadUrl = url;
                            break;
                        }
                    }
                } else if (considerAlphaBeta && (newVersion.prerelease == "alpha" || newVersion.prerelease == "beta")) {
                    const compareResult = compareVersions(newVersion, currentVersion)
                    if (compareResult == 1) {
                        // greater
                        const url = getReleaseAsset(rel, assetFileName)
                        if (url != null) {
                            downloadUrl = url;
                            break;
                        }
                    }
                }
            } else {
                const compareResult = compareVersions(newVersion, currentVersion)
                if (compareResult == 1) {
                    // greater
                    const url = getReleaseAsset(rel, assetFileName)
                    if (url != null) {
                        downloadUrl = url;
                        break;
                    }
                }
            }
        }

    }

    // no update found
    if (!downloadUrl) {
        return null;
    }

    console.log("determined lsp update package download url", downloadUrl)

    // Download zip
    const zipPath = path.join(binaryDir, assetFileName);
    const marker = path.join(extractedPath, '.ready');
    return downloadAndExtractLsp("Downloading Chemical LSP Update", downloadUrl, zipPath, extractedPath, marker).then(() => {
        fs.rmSync(zipPath)
        return path.join(extractedPath, assetName);
    })

}

function doLocalUpdateBeforeLaunch(context : vscode.ExtensionContext) {

    // Determine asset name based on platform
    let assetName = getLspReleaseAssetName()
    if (assetName == null) {
        // unsupported platform
        return;
    }

    // Prepare storage path
    const storageUri = context.globalStorageUri;
    const binaryDir = storageUri.fsPath;
    const lspExtractedPath = path.join(binaryDir, "lsp")
    const updateExtractedPath = path.join(binaryDir, "lsp-update");

    // check lsp-update exists
    if(!fs.existsSync(updateExtractedPath)) {
        return false;
    }

    // just to make sure lsp does exists
    if(!fs.existsSync(lspExtractedPath)) {
        return false;
    }

    // delete the lsp directory
    fs.rmSync(lspExtractedPath, { force : true, recursive : true })

    // rename to new lsp directory
    fs.renameSync(updateExtractedPath, lspExtractedPath)

}

/**
 * Download and extract the LSP binary for the current OS.
 * Checks up to `maxReleases` most recent releases (including prereleases).
 */
async function downloadLspPackage(context: vscode.ExtensionContext): Promise<string> {

    // Determine asset name based on platform
    let assetName = getLspReleaseAssetName()
    if (assetName == null) {
        return new Promise((resolve, reject) => reject(new Error(`Unsupported platform: ${process.platform}`)))
    }

    // Prepare storage path
    const storageUri = context.globalStorageUri;
    const binaryDir = storageUri.fsPath;
    const extractedPath = path.join(binaryDir, 'lsp');

    // lets create directory for storing the lsp zip
    if (!fs.existsSync(binaryDir)) {
        fs.mkdirSync(binaryDir, { recursive: true });
    }

    // Fetch releases from GitHub API
    const releases = await fetchReleases(repoOwner, repoName)
    // console.log("fetched releases : ", releases)

    let assetFileName = assetName + ".zip"

    // Find asset download URL
    let downloadUrl: string | undefined;
    for (let i = 0; i < Math.min(maxReleases, releases.length); i++) {
        const rel = releases[i];
        const asset = rel.assets.find((a: any) => a.name === assetFileName);
        if (asset) {
            downloadUrl = asset.browser_download_url;
            break;
        }
    }
    if (!downloadUrl) {
        return new Promise((resolve, reject) => reject(new Error(`Asset ${assetFileName} not found in the last ${maxReleases} releases.`)))
    }

    console.log("determined lsp package download url", downloadUrl)

    // Download zip
    const zipPath = path.join(binaryDir, assetFileName);
    const marker = path.join(extractedPath, '.ready');
    return downloadAndExtractLsp("Downloading Chemical LSP...", downloadUrl, zipPath, extractedPath, marker).then(() => {
        fs.rmSync(zipPath)
        return path.join(extractedPath, assetName);
    })

}

let childProcess: ChildProcessWithoutNullStreams | null = null;
let launchedLspPath : string | null = null;

async function launchLsp(lspPath: string): Promise<void> {

    // set to global variable for accessing it for commands
    launchedLspPath = lspPath;

    // Launch the LSP process using spawn
    // [] is where you'd pass command-line arguments if needed
    childProcess = spawn(lspPath, [], { stdio: 'pipe' });

    // Listen to stdout
    childProcess.stdout.on('data', (data) => {
        console.log(`Chemical LSP stdout: ${data}`);
    });

    // Listen to stderr
    childProcess.stderr.on('data', (data) => {
        console.error(`Chemical LSP stderr: ${data}`);
    });

    // Handle process exit
    childProcess.on('exit', (code, signal) => {
        console.log(`Chemical LSP exited with code ${code}, signal ${signal}`);
    });

    // Handle possible spawn errors
    childProcess.on('error', (err) => {
        vscode.window.showErrorMessage(`Error launching Chemical LSP: ${err.message}`);
    });

    // Optional: Wait a bit to ensure process is running
    return new Promise((resolve) => {
        setTimeout(() => resolve(), 500);
    });
}

function searchLspExecutable(dirPath: string): string | null {
    console.log("searching for lsp executable at path", dirPath)
    const platformExtension = os.platform() === 'win32' ? '.exe' : '';
    const lspExecutableNames = ["lsp", "ChemicalLSP", "chemical-lsp"]
    for (const lspExeName of lspExecutableNames) {
        const lspExecutableName = lspExeName + platformExtension;
        const potentialLspPath = path.join(dirPath, lspExecutableName);
        if (fs.existsSync(potentialLspPath)) {
            return potentialLspPath;
        }
    }
    return null;
}

function findEnvLspPath(): string | null {
    const envVars = ['CHEMICAL_LSP_HOME'];
    let lspPath: string | null = null;
    for (const envVar of envVars) {
        const envValue = process.env[envVar];
        if (envValue && fs.existsSync(envValue)) {
            const found = searchLspExecutable(envValue)
            if (found != null) {
                lspPath = found;
                break;
            }
        }
    }
    return lspPath;
}

async function launchLspFromPkgDir(pkgDir: string): Promise<void> {
    const found = searchLspExecutable(pkgDir)
    if (found != null) {
        return launchLsp(found)
    } else {
        return new Promise((resolve, reject) => reject("couldn't find lsp executable in downloaded package"))
    }
}

// returns whether update should be checked
async function findAndlaunchLSP(context: vscode.ExtensionContext): Promise<boolean> {
    const lspPath = findEnvLspPath()
    if (lspPath) {
        return launchLsp(lspPath).then(() => false);
    } else {
        return getLspPkgDir(context).then((pkgDir) => {
            if (pkgDir != null) {
                doLocalUpdateBeforeLaunch(context)
                return launchLspFromPkgDir(pkgDir).then(() => true);
            } else {
                return downloadLspPackage(context).then((pkgDir) => {
                    return launchLspFromPkgDir(pkgDir).then(() => false)
                })
            }
        })
    }
}

const DefaultLSPHost = "127.0.0.1"
const DefaultLSPPort = 5007;

function launchLanguageClient(context: ExtensionContext): Promise<string | null> {

    let serverOptions = () => {
        // Connect to language server via socket
        let socket = net.connect({ port: DefaultLSPPort })
        let result: StreamInfo = {
            writer: socket,
            reader: socket
        };
        return Promise.resolve(result);
    };

    let clientOptions: LanguageClientOptions = {
        documentSelector: [{ pattern: "**/*.ch", scheme: 'file', language: 'chemical' }],
        synchronize: {
            fileEvents: workspace.createFileSystemWatcher('**/*.ch')
        }
    };

    // Create the language client and start the client.
    lc = new LanguageClient('Chemical Server', serverOptions, clientOptions);

    context.subscriptions.push(vscode.languages.registerDocumentSemanticTokensProvider({ language: "chemical" }, new DocumentSemanticTokensProvider(), legend));

    lc.setTrace(Trace.Verbose);

    lc.registerProposedFeatures();

    return lc.start().then(() => {
        console.log("[Debug] ChemicalLSP Running")

        let result = lc.initializeResult
        if (result != null) {
            let info = result.serverInfo
            if (info != null) {
                let version = info.version
                if (version != null) {
                    return version;
                }
            }
        }

        return null;

    }).catch((e) => {

        console.log("error launching lsp", e);

        return null;

    })

}

async function isPortOccupied(host: string, port: number): Promise<boolean> {
    return new Promise((resolve) => {
        const client = new net.Socket();
        client.once('connect', () => {
            client.end();
            resolve(true);
        });
        client.once('error', () => {
            resolve(false);
        });
        client.connect({ port, host });
    });
}

export function activate(context: ExtensionContext) {

    const isDevelopment = context.extensionMode == vscode.ExtensionMode.Development; // or use your own env variable

    if (isDevelopment) {
        isPortOccupied(DefaultLSPHost, DefaultLSPPort).then((is_occupied) => {
            if (is_occupied) {
                vscode.window.showInformationMessage("Port Occupied, Chemical LSP Development Mode");
                // Only launch the language client directly in development mode
                launchLanguageClient(context);
            } else {
                // default lsp port is not occupied, we must launch the LSP
                const launched = findAndlaunchLSP(context)
                launched.then((checkForUpdates) => {
                    console.log("Launched Chemical LSP executable");
                    launchLanguageClient(context).then((currVersion) => {
                        if (checkForUpdates) {
                            downloadLspPackageUpdate(context, currVersion, false, true)
                        }
                    })
                }).catch((e) => {
                    console.error("error launching lsp", e)
                    vscode.window.showErrorMessage("error launching chemical lsp '" + e + '\'');
                })
            }
        })
    } else {
        // In production mode, launch the LSP first, then the client
        const launched = findAndlaunchLSP(context)
        launched.then((checkForUpdates) => {
            console.log("Launched Chemical LSP executable");
            launchLanguageClient(context).then((currVersion) => {
                if (checkForUpdates) {
                    downloadLspPackageUpdate(context, currVersion, false, true);
                }
            });
        }).catch((e) => {
            console.error("error launching lsp", e)
            vscode.window.showErrorMessage("error launching chemical lsp '" + e + '\'');
        })
    }

    context.subscriptions.push(
        vscode.commands.registerCommand("run-button.debug", () => {
            updateRunButtonVisibility(context, RunButtonStatus.Running);
            if(launchedLspPath == null) {
                vscode.window.showInformationMessage("LSP not yet started");
            } else {
                const lspPath = getConfiguredLspPath(launchedLspPath);
                compileAndRunCommand(lspPath);
            }
            setTimeout(() => {
                updateRunButtonVisibility(context, RunButtonStatus.Stopped);
            }, 3000);
        })
    );
    context.subscriptions.push(
        vscode.commands.registerCommand("run-button.restart", () => {
            vscode.window.showInformationMessage("Not Implemented Restarting");
            updateRunButtonVisibility(context, RunButtonStatus.Running);
            setTimeout(() => {
                updateRunButtonVisibility(context, RunButtonStatus.Stopped);
            }, 3000);
        })
    );
    context.subscriptions.push(
        vscode.commands.registerCommand("run-button.stop", () => {
            vscode.window.showInformationMessage("Not Implemented Stopped");
            updateRunButtonVisibility(context, RunButtonStatus.Stopped);
        })
    );

    updateRunButtonVisibility(context, RunButtonStatus.Stopped);

    // project selection

    let currentProject = 'Project 1'; // Default project

    // Create a status bar item
    const statusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, 100);
    statusBarItem.text = `$(folder) ${currentProject}`;
    statusBarItem.tooltip = 'Select Chemical Project';
    statusBarItem.command = 'chemical.selectProject';
    statusBarItem.show();

    context.subscriptions.push(statusBarItem);

    // Register the command
    const selectProjectCommand = vscode.commands.registerCommand('chemical.selectProject', async () => {
        const projects = ['Project 1', 'Project 2'];
        const selectedProject = await vscode.window.showQuickPick(projects, {
            placeHolder: 'Select a project',
        });

        if (selectedProject) {
            currentProject = selectedProject;
            statusBarItem.text = `$(folder) ${currentProject}`;
        }
    });

    context.subscriptions.push(selectProjectCommand);

}

enum RunButtonStatus {
    Running,
    Stopped
}

function updateRunButtonVisibility(context, status: RunButtonStatus) {
    // Show/hide commands based on conditions
    var canStart = true;
    var canRestart = true;
    var canStop = true;
    if (status == RunButtonStatus.Running) {
        canStart = false;
    } else {
        canRestart = false;
        canStop = false;
    }
    vscode.commands.executeCommand('setContext', 'chemicalRunButton:canStart', canStart);
    vscode.commands.executeCommand('setContext', 'chemicalRunButton:canRestart', canRestart);
    vscode.commands.executeCommand('setContext', 'chemicalRunButton:canStop', canStop);
}

export function deactivate() {
    return lc.stop().then(() => {
        console.log("[Debug] ChemicalLSP Stopped")
        if (childProcess) {
            console.log('Shutting down Chemical LSP...');
            childProcess.kill(); // Sends SIGTERM
            childProcess = null;
        }
    }).catch((e) => {
        console.error("[Debug] Error Stopping ChemicalLSP", e)
    });
}

// interface IParsedToken {
// 	line: number;
// 	startCharacter: number;
// 	length: number;
// 	tokenType: string;
// 	tokenModifiers: string[];
// }

class DocumentSemanticTokensProvider implements vscode.DocumentSemanticTokensProvider {

    async provideDocumentSemanticTokens(document: vscode.TextDocument, token: vscode.CancellationToken): Promise<vscode.SemanticTokens> {
        console.log("[Request] textDocument/semanticTokens/full");
        // @ts-ignore
        return lc.sendRequest("textDocument/semanticTokens/full", {
            textDocument: {
                uri: document.uri.toString()
            }
        } satisfies SemanticTokensParams).catch(e => {
            console.error("Error sending semantic tokens request", e)
            return Promise.reject(e)
        })
    }

    // TODO
    // onDidChangeSemanticTokens ?: vscode.Event<void> = function (e) {
    // Not implemented Yet
    // Also the return type is Disposable
    // }

    // TODO
    // async provideDocumentSemanticTokensEdits(document: vscode.TextDocument, previousResultId: string, token: vscode.CancellationToken): vscode.ProviderResult<vscode.SemanticTokens | vscode.SemanticTokensEdits> {
    // Not implemented Yet
    // }

    // private _encodeTokenType(tokenType: string): number {
    //     if (tokenTypes.has(tokenType)) {
    //         return tokenTypes.get(tokenType)!;
    //     } else if (tokenType === 'notInLegend') {
    //         return tokenTypes.size + 2;
    //     }
    //     return 0;
    // }

    // private _encodeTokenModifiers(strTokenModifiers: string[]): number {
    //     let result = 0;
    //     for (let i = 0; i < strTokenModifiers.length; i++) {
    //         const tokenModifier = strTokenModifiers[i];
    //         if (tokenModifiers.has(tokenModifier)) {
    //             result = result | (1 << tokenModifiers.get(tokenModifier)!);
    //         } else if (tokenModifier === 'notInLegend') {
    //             result = result | (1 << tokenModifiers.size + 2);
    //         }
    //     }
    //     return result;
    // }

    // private async _convertParsedTokens(allTokens : IParsedToken[]) : Promise<vscode.SemanticTokens> {
    //     const builder = new vscode.SemanticTokensBuilder();
    //     allTokens.forEach((token) => {
    //         builder.push(token.line, token.startCharacter, token.length, this._encodeTokenType(token.tokenType), this._encodeTokenModifiers(token.tokenModifiers));
    //     });
    //     return builder.build();
    // }

}