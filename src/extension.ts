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
import { compileAndRunCommand, getConfiguredLspPath, registerChemicalTasks, getBuildFlags, getOutputPath, buildTerminalCommand } from "./compileAndRun";

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
    const platform = process.platform;
    // Default to x64 unless arm64 is explicitly detected
    const arch = process.arch === 'arm64' ? 'arm64' : 'x64';
    switch (platform) {
        case 'win32':
            return `windows-${arch}-lsp.zip`;
        case 'darwin':
            return `macos-${arch}-lsp.zip`;
        case 'linux':
            return `linux-${arch}-lsp.zip`;
        default:
            return null;
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
        return extractedPath;
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
    currVersion: string | null,
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

    if(currVersion == null) {
        console.error("current version given to downloadLspPackageUpdate is null");
        return null;
    }

    const currentVersion = parseVersion(currVersion)
    if (currentVersion == null) {
        console.error("couldn't parse current version", currVersion);
        return null;
    }

    let assetFileName = assetName

    //   // Find asset download URL
    let downloadUrl: string | undefined;
    for (let i = 0; i < Math.min(maxReleases, releases.length); i++) {
        const rel = releases[i];
        if (rel.name != null) {
            const newVersion = parseVersion(rel.name)
            if(newVersion == null) {
                continue;
            }
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

    let assetFileName = assetName

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
        return extractedPath;
    })

}

let childProcess: ChildProcessWithoutNullStreams | null = null;
let launchedLspPath : string | null = null;

async function launchLsp(lspPath: string, args: string[] = []): Promise<void> {

    // set to global variable for accessing it for commands
    launchedLspPath = lspPath;

    // Launch the LSP process using spawn
    childProcess = spawn(lspPath, args, { stdio: 'pipe' });

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
    const lspExecutableNames = ["lsp", "ChemicalLsp", "chemical-lsp"]
    for (const lspExeName of lspExecutableNames) {
        const lspExecutableName = lspExeName + platformExtension;
        const potentialLspPath = path.join(dirPath, lspExecutableName);
        if (fs.existsSync(potentialLspPath) && fs.statSync(potentialLspPath).isFile()) {
            return potentialLspPath;
        }
    }
    // Not found directly — check inside a "chemical-lsp" subdirectory
    // (the zip archive extracts with a "chemical-lsp/" root directory)
    const subDir = path.join(dirPath, "chemical-lsp");
    if (fs.existsSync(subDir)) {
        return searchLspExecutable(subDir);
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

async function launchLspFromPkgDir(pkgDir: string, args: string[] = []): Promise<void> {
    const found = searchLspExecutable(pkgDir)
    if (found != null) {
        return launchLsp(found, args)
    } else {
        return new Promise((resolve, reject) => reject("couldn't find lsp executable in downloaded package"))
    }
}

function findConfiguredLspPath(): string | null {
    const configuredPath = vscode.workspace.getConfiguration('chemical').get<string>('lsp.path', '');
    if (configuredPath && fs.existsSync(configuredPath)) {
        const found = searchLspExecutable(configuredPath);
        if (found != null) {
            console.log("Found LSP executable via chemical.lsp.path setting:", found);
            return found;
        }
    }
    return null;
}

// returns whether update should be checked
async function findAndlaunchLSP(context: vscode.ExtensionContext, useStdio: boolean = false): Promise<boolean> {
    const lspArgs = useStdio ? ["--stdio"] : [];
    // Priority: 1) GUI setting, 2) env var, 3) downloaded package
    const lspPath = findConfiguredLspPath() || findEnvLspPath()
    if (lspPath) {
        return launchLsp(lspPath, lspArgs).then(() => false);
    } else {
        return getLspPkgDir(context).then((pkgDir) => {
            if (pkgDir != null) {
                doLocalUpdateBeforeLaunch(context)
                return launchLspFromPkgDir(pkgDir, lspArgs).then(() => true);
            } else {
                return downloadLspPackage(context).then((pkgDir) => {
                    return launchLspFromPkgDir(pkgDir, lspArgs).then(() => false)
                })
            }
        })
    }
}

const DefaultLSPHost = "127.0.0.1"
const DefaultLSPPort = 5007;

function launchLanguageClient(context: ExtensionContext, useStdio: boolean = false): Promise<string | null> {

    let serverOptions = () => {
        if (useStdio && childProcess) {
            // Connect via stdio (stdin/stdout) instead of TCP socket
            // This avoids socket FD leaking to child build processes
            let result: StreamInfo = {
                writer: childProcess.stdin,
                reader: childProcess.stdout
            };
            return Promise.resolve(result);
        }
        if (useStdio) {
            console.warn("chemical.lsp.stdio is enabled but LSP process is not running, falling back to TCP socket");
        }
        // Default: Connect to language server via TCP socket
        let socket = net.connect({ port: DefaultLSPPort })
        let result: StreamInfo = {
            writer: socket,
            reader: socket
        };
        return Promise.resolve(result);
    };

    let clientOptions: LanguageClientOptions = {
        documentSelector: [
            { scheme: 'file', language: 'chemical' },
            { scheme: 'file', language: 'chemical-lab' },
            { scheme: 'file', language: 'chemical-mod' }
        ],
        synchronize: {
            fileEvents: [
                workspace.createFileSystemWatcher('**/*.ch'),
                workspace.createFileSystemWatcher('**/*.lab'),
                workspace.createFileSystemWatcher('**/chemical.mod')
            ]
        }
    };

    // Create the language client and start the client.
    lc = new LanguageClient('Chemical Server', serverOptions, clientOptions);

    context.subscriptions.push(vscode.languages.registerDocumentSemanticTokensProvider({ language: "chemical" }, new DocumentSemanticTokensProvider(), legend));

    lc.setTrace(Trace.Verbose);

    lc.registerProposedFeatures();

    return lc.start().then(() => {
        console.log("[Debug] ChemicalLSP Running")

        context.subscriptions.push(
            lc.onNotification("chemical/buildStatus", (params: any) => {
                if (!params.success) {
                    vscode.window.showErrorMessage(
                        'Chemical build failed',
                        'Configure', 'Run'
                    ).then(selection => {
                        if (selection === 'Configure') {
                            vscode.commands.executeCommand('chemical.configure');
                        } else if (selection === 'Run') {
                            vscode.commands.executeCommand('chemical.runBuild');
                        }
                    });
                }
            })
        );

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

let isChemicalTaskRunning = false;

export function activate(context: ExtensionContext) {

    const isDevelopment = context.extensionMode == vscode.ExtensionMode.Development; // or use your own env variable

    // Read the stdio transport setting (default: TCP socket for GDB debugging)
    const useStdio = vscode.workspace.getConfiguration('chemical').get<boolean>('lsp.stdio', false);

    if (isDevelopment) {
        isPortOccupied(DefaultLSPHost, DefaultLSPPort).then((is_occupied) => {
            if (is_occupied) {
                vscode.window.showInformationMessage("Port Occupied, Chemical LSP Development Mode");
                // Only launch the language client directly in development mode
                launchLanguageClient(context, useStdio);
            } else {
                // default lsp port is not occupied, we must launch the LSP
                const launched = findAndlaunchLSP(context, useStdio)
                launched.then((checkForUpdates) => {
                    console.log("Launched Chemical LSP executable");
                    launchLanguageClient(context, useStdio).then((currVersion) => {
                        if(launchedLspPath != null) {
                            registerChemicalTasks(context, launchedLspPath)
                        }
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
        const launched = findAndlaunchLSP(context, useStdio)
        launched.then((checkForUpdates) => {
            console.log("Launched Chemical LSP executable");
            launchLanguageClient(context, useStdio).then((currVersion) => {
                if(launchedLspPath != null) {
                    registerChemicalTasks(context, launchedLspPath)
                }
                if (checkForUpdates) {
                    downloadLspPackageUpdate(context, currVersion, false, true);
                }
            });
        }).catch((e) => {
            console.error("error launching lsp", e)
            vscode.window.showErrorMessage("error launching chemical lsp '" + e + '\'');
        })
    }

    function getActiveBuildFilePath(): string | undefined {
        const editor = vscode.window.activeTextEditor;
        if (!editor) return undefined;
        const fileName = path.basename(editor.document.fileName);
        if (fileName === 'chemical.mod' || fileName === 'build.lab') {
            return editor.document.fileName;
        }
        return undefined;
    }

    function buildInTerminal(lspPath: string, buildFile: string, extraArgs: string[], description: string) {
        const flags = getBuildFlags();
        const args = [...extraArgs, ...flags];
        const term = vscode.window.createTerminal(`Chemical ${description}`);
        term.show(true);
        const cmd = buildTerminalCommand(lspPath, args);
        term.sendText(cmd);
        return term;
    }

    // Configure command: build the build file without running
    context.subscriptions.push(
        vscode.commands.registerCommand("chemical.configure", async () => {
            const buildFile = getActiveBuildFilePath();
            if (!buildFile) {
                vscode.window.showErrorMessage('Open chemical.mod or build.lab first.');
                return;
            }
            if (!launchedLspPath) {
                vscode.window.showErrorMessage('Chemical LSP not started.');
                return;
            }
            const outputPath = getOutputPath();
            buildInTerminal(launchedLspPath, buildFile,
                ['cc', `"${buildFile}"`, '-o', `"${outputPath}"`],
                'Configure');
        })
    );

    // Run build command: compile and run the build file
    context.subscriptions.push(
        vscode.commands.registerCommand("chemical.runBuild", async () => {
            if (isChemicalTaskRunning) return;
            const buildFile = getActiveBuildFilePath();
            if (!buildFile) {
                vscode.window.showErrorMessage('Open chemical.mod or build.lab first.');
                return;
            }
            if (!launchedLspPath) {
                vscode.window.showErrorMessage('Chemical LSP not started.');
                return;
            }

            isChemicalTaskRunning = true;
            await updateRunButtonVisibility(context, RunButtonStatus.Running);

            try {
                const outputPath = getOutputPath();
                const term = buildInTerminal(launchedLspPath, buildFile,
                    ['cc', 'run', `"${buildFile}"`, '-o', `"${outputPath}"`],
                    'Run');
                // Wait for terminal process to finish and update button state
                const disposable = vscode.window.onDidCloseTerminal((closedTerm) => {
                    if (closedTerm === term) {
                        updateRunButtonVisibility(context, RunButtonStatus.Stopped);
                        isChemicalTaskRunning = false;
                        disposable.dispose();
                    }
                });
            } catch (err) {
                vscode.window.showErrorMessage('Failed to run build: ' + err);
                updateRunButtonVisibility(context, RunButtonStatus.Stopped);
                isChemicalTaskRunning = false;
            }
        })
    );

    // Run options command: show webview panel with form controls
    context.subscriptions.push(
        vscode.commands.registerCommand("chemical.runOptions", async () => {
            const config = vscode.workspace.getConfiguration('chemical');

            const panel = vscode.window.createWebviewPanel(
                'chemicalBuildOptions',
                'Chemical Build Settings',
                vscode.ViewColumn.Active,
                { enableScripts: true }
            );

            function getSettings() {
                return {
                    mode: config.get<string>('build.mode', 'debug'),
                    noCache: config.get<boolean>('build.noCache', false),
                    pluginMode: config.get<string>('build.pluginMode', ''),
                    recompilePlugins: config.get<boolean>('build.recompilePlugins', false),
                    incremental: config.get<boolean>('build.incremental', false),
                    customOutput: config.get<boolean>('build.customOutput', false),
                    outputPath: config.get<string>('build.outputPath', '')
                };
            }

            function renderHtml() {
                const s = getSettings();
                const modes = ['debug', 'release', 'debug_complete', 'debug_quick'];
                const pluginModes = ['default', 'debug', 'release', 'debug_complete', 'debug_quick'];

                panel.webview.html = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style>
    body { font-family: var(--vscode-font-family); font-size: var(--vscode-font-size); color: var(--vscode-editor-foreground); background: var(--vscode-editor-background); padding: 12px 16px; margin: 0; }
    .field { margin-bottom: 12px; }
    label { display: block; margin-bottom: 3px; font-weight: 500; }
    .desc { font-size: 11px; color: var(--vscode-descriptionForeground); margin: 2px 0 0 0; }
    select, input[type=text] { width: 100%; padding: 4px 6px; background: var(--vscode-input-background); color: var(--vscode-input-foreground); border: 1px solid var(--vscode-input-border); border-radius: 2px; box-sizing: border-box; font-family: inherit; font-size: inherit; }
    .cb-row { display: flex; align-items: center; gap: 8px; padding: 4px 0; }
    .cb-row input { accent-color: var(--vscode-focusBorder); width: 15px; height: 15px; margin: 0; cursor: pointer; }
    .cb-row label { margin: 0; cursor: pointer; font-weight: 400; }
    .output-row { margin: 6px 0 0 23px; display: ${s.customOutput ? 'block' : 'none'}; }
</style>
</head>
<body>
    <div class="field">
        <label for="mode">Mode</label>
        <select id="mode" onchange="save('build.mode',this.value)">
            ${modes.map(m => `<option value="${m}"${s.mode===m?' selected':''}>${m}</option>`).join('')}
        </select>
    </div>
    <div class="field">
        <div class="cb-row">
            <input type="checkbox" id="noCache" ${s.noCache?'checked':''} onchange="save('build.noCache',this.checked)">
            <label for="noCache">No Cache</label>
        </div>
        <div class="desc">Enable --no-cache flag</div>
    </div>
    <div class="field">
        <label for="pluginMode">Plugin Mode</label>
        <select id="pluginMode" onchange="save('build.pluginMode',this.value==='default'?'':this.value)">
            ${pluginModes.map(m => `<option value="${m}"${(m==='default'?'':s.pluginMode)===(m==='default'?'':m)?' selected':''}>${m}</option>`).join('')}
        </select>
    </div>
    <div class="field">
        <div class="cb-row">
            <input type="checkbox" id="recompilePlugins" ${s.recompilePlugins?'checked':''} onchange="save('build.recompilePlugins',this.checked)">
            <label for="recompilePlugins">Recompile Plugins</label>
        </div>
        <div class="desc">Enable -frecompile-plugins flag</div>
    </div>
    <div class="field">
        <div class="cb-row">
            <input type="checkbox" id="incremental" ${s.incremental?'checked':''} onchange="save('build.incremental',this.checked)">
            <label for="incremental">Incremental Compilation</label>
        </div>
        <div class="desc">Enable --incremental flag</div>
    </div>
    <div class="field">
        <div class="cb-row">
            <input type="checkbox" id="customOutput" ${s.customOutput?'checked':''} onchange="toggleOutput(this.checked)">
            <label for="customOutput">Custom Output Path</label>
        </div>
        <div class="desc">Use custom output path instead of temporary file</div>
        <div class="output-row" id="outputRow">
            <input type="text" id="outputPath" placeholder="/path/to/output.exe" value="${s.outputPath}" onchange="save('build.outputPath',this.value)">
        </div>
    </div>
<script>
    const api = acquireVsCodeApi();
    function save(k,v) { api.postMessage({type:'update',key:k,value:v}); }
    function toggleOutput(checked) {
        document.getElementById('outputRow').style.display = checked ? 'block' : 'none';
        save('build.customOutput', checked);
    }
</script>
</body>
</html>`;
            }

            panel.webview.onDidReceiveMessage(async (msg) => {
                if (msg.type === 'update') {
                    await config.update(msg.key, msg.value, vscode.ConfigurationTarget.Workspace);
                }
            });

            renderHtml();
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

function updateRunButtonVisibility(context : vscode.ExtensionContext, status: RunButtonStatus) {
  // sets the context key 'chemical:isRunning' to true/false
  return vscode.commands.executeCommand(
    'setContext',
    'chemical:isRunning',
    status === RunButtonStatus.Running
  );
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