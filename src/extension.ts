'use strict';

import * as net from "net"
import * as vscode from 'vscode';
import { Trace } from 'vscode-jsonrpc';
import { window, workspace, commands, ExtensionContext, Uri, TextDocument, languages, SemanticTokensLegend, CancellationToken, ProviderResult, SemanticTokens, TextDocumentChangeEvent } from 'vscode';
import { LanguageClient, LanguageClientOptions, StreamInfo, Position as LSPosition, Location as LSLocation, SemanticTokenTypes, SemanticTokenModifiers, TextDocumentIdentifier, SemanticTokensParams, DidChangeTextDocumentParams, DidOpenTextDocumentParams, DidCloseTextDocumentParams } from 'vscode-languageclient/node';

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

export function activate(context: ExtensionContext) {

    let serverOptions = () => {
        // Connect to language server via socket
        let socket = net.connect({ port: 5007 })
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

    // context.subscriptions.push(
    //     workspace.onDidOpenTextDocument((document : TextDocument) => {
    //         const params = {
    //             textDocument : {
    //                 uri : document.uri.toString(),
    //                 version : document.version,
    //                 languageId : document.languageId,
    //                 text : document.getText()
    //             }
    //         } satisfies DidOpenTextDocumentParams
    //         console.log("[Request] textDocument/didOpen", params)
    //         lc.sendNotification("textDocument/didOpen", params).catch(e => {
    //             console.error("Error sending did open text document params")
    //             return Promise.reject(e)
    //         })
    //     })
    // )

    // context.subscriptions.push(
    //     workspace.onDidChangeTextDocument((event : TextDocumentChangeEvent) => {
    //         const params = {
    //             textDocument : {
    //                 version: event.document.version,
    //                 uri: event.document.uri.toString()
    //             },
    //             // @ts-ignore since readonly property won't be modified, as its just being serialized
    //             contentChanges : event.contentChanges
    //         } satisfies DidChangeTextDocumentParams
    //         console.log("[Request] textDocument/didChange", params);
    //         lc.sendNotification("textDocument/didChange", params).catch(e => {
    //             console.error("Error sending did change text document params")
    //             return Promise.reject(e)
    //         })
    //     })
    // );

    // context.subscriptions.push(
    //     workspace.onDidCloseTextDocument((document : TextDocument) => {
    //         const params : DidCloseTextDocumentParams = {
    //             textDocument : {
    //                 uri : document.uri.toString()
    //             }
    //         }
    //         console.log("[Request] textDocument/didClose", params)
    //         lc.sendNotification("textDocument/didClose", params).catch(e => {
    //             console.error("Error sending did close text document params")
    //             return Promise.reject(e)
    //         })
    //     })
    // )

    context.subscriptions.push(vscode.languages.registerDocumentSemanticTokensProvider({ language : "chemical" }, new DocumentSemanticTokensProvider(), legend));

    lc.setTrace(Trace.Verbose);
    
    lc.registerProposedFeatures();
    
    return lc.start().then(() => {
        console.log("[Debug] ChemicalLSP Running")
    }).catch((e) => {
        console.error("[Debug] Error running ChemicalLSP", e)
    });

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