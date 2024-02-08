'use strict';

import * as net from "net"

import {Trace} from 'vscode-jsonrpc';
import { window, workspace, commands, ExtensionContext, Uri } from 'vscode';
import { LanguageClient, LanguageClientOptions, StreamInfo, Position as LSPosition, Location as LSLocation } from 'vscode-languageclient/node';

let lc: LanguageClient;

export function activate(context: ExtensionContext) {
    let serverOptions = () => {
        // Connect to language server via socket
        let socket = net.connect({ port : 5007 })
        let result: StreamInfo = {
            writer: socket,
            reader: socket
        };
        return Promise.resolve(result);
    };
    
    let clientOptions: LanguageClientOptions = {
        documentSelector: ['ch'],
        synchronize: {
            fileEvents: workspace.createFileSystemWatcher('**/*.ch')
        }
    };
    
    // Create the language client and start the client.
    lc = new LanguageClient('Chemical Server', serverOptions, clientOptions);

    lc.setTrace(Trace.Verbose);
    lc.start();
    console.log("[Debug] ChemicalLSP Running")
}

export function deactivate() {
    console.log("[Debug] ChemicalLSP Stopping")
    return lc.stop();
}