'use strict';

import * as net from "net"
import * as vscode from 'vscode';
import { Trace } from 'vscode-jsonrpc';
import { window, workspace, commands, ExtensionContext, Uri, TextDocument, languages, SemanticTokensLegend, CancellationToken, ProviderResult, SemanticTokens, TextDocumentChangeEvent } from 'vscode';
import { LanguageClient, LanguageClientOptions, StreamInfo, Position as LSPosition, Location as LSLocation, SemanticTokenTypes, SemanticTokenModifiers, TextDocumentIdentifier, SemanticTokensParams, DidChangeTextDocumentParams, DidOpenTextDocumentParams, DidCloseTextDocumentParams } from 'vscode-languageclient/node';
import * as fs from 'fs';
import { exec } from 'child_process';
import * as os from 'os';
import * as path from 'path';

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

function launchLSP(onLaunched : () => void) {

    const platformExtension = os.platform() === 'win32' ? '.exe' : '';
    const lspExecutableNames = ["ChemicalLSP", "lsp", "chemical-lsp"] 
    const envVars = ['CHEMICAL-HOME', 'CHEMICAL_HOME', 'CHEMICAL_BIN'];
    let lspPath: string | null = null;

    for (const envVar of envVars) {
        const envValue = process.env[envVar];
        if (envValue && fs.existsSync(envValue)) {
            var found = false;
            for(const lspExeName of lspExecutableNames) {
                const lspExecutableName = lspExeName + platformExtension;
                const potentialLspPath = path.join(envValue, lspExecutableName);
                if (fs.existsSync(potentialLspPath)) {
                    lspPath = potentialLspPath;
                    found = true;
                    break;
                }
            }
            if(found) break;
        }
    }

    if (!lspPath) {
        vscode.window.showErrorMessage("Couldn't find Chemical LSP executable. Please install LSP or ensure the environment variable is set correctly.");
        return;
    }

   // Launch the executable with parameters
   // TODO give parameters to the lsp executable that it's being run by the extension
    const childProcess = exec(lspPath, (error, stdout, stderr) => {
        if (error) {
            vscode.window.showErrorMessage(`Error launching Chemical LSP: ${error.message}`);
            return;
        }
        if (stderr) {
            vscode.window.showErrorMessage(`Chemical LSP error: ${stderr}`);
            return;
        }
        console.log(`Chemical LSP shutdown successfully: ${stdout}`);
    });

    // Redirect stdout and stderr
    childProcess.stdout.on('data', (data) => {
        console.log(`stdout: ${data}`);
    });

    childProcess.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });

    setTimeout(onLaunched, 500);

}

const DefaultLSPHost = "127.0.0.1"
const DefaultLSPPort = 5007;

function launchLanguageClient(context : ExtensionContext) {

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
        documentSelector: [{ pattern : "**/*.ch", scheme: 'file', language: 'chemical' }],
        synchronize: {
            fileEvents: workspace.createFileSystemWatcher('**/*.ch')
        }
    };

    // Create the language client and start the client.
    lc = new LanguageClient('Chemical Server', serverOptions, clientOptions);

    context.subscriptions.push(vscode.languages.registerDocumentSemanticTokensProvider({ language : "chemical" }, new DocumentSemanticTokensProvider(), legend));

    lc.setTrace(Trace.Verbose);
    
    lc.registerProposedFeatures();
    
    return lc.start().then(() => {
        console.log("[Debug] ChemicalLSP Running")
    }).catch((e) => {
        console.error("[Debug] Error running ChemicalLSP", e)
    });

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
            if(is_occupied) {
                vscode.window.showInformationMessage("Launching Chemical LSP In Development Mode");
                // Only launch the language client directly in development mode
                launchLanguageClient(context);
            } else {
                // default lsp port is not occupied, we must launch the LSP
                launchLSP(() => {
                    launchLanguageClient(context);
                    console.log("Launched Chemical LSP executable");
                });
            }
        })
    } else {
        // In production mode, launch the LSP first, then the client
        launchLSP(() => {
            launchLanguageClient(context);
            console.log("Launched Chemical LSP executable");
        });
    }

}

export function deactivate() {
    return lc.stop().then(() => {
        console.log("[Debug] ChemicalLSP Stopped")
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
            textDocument : {
                uri : document.uri.toString()
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