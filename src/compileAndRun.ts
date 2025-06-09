import * as vscode from 'vscode';

// ---- Core logic (no VS Code context) ----
/**
 * Search workspace for `chemical.mod` or `build.lab` (first match)
 */
export async function findSourceFile(): Promise<string | undefined> {
  const chem = await vscode.workspace.findFiles('**/chemical.mod', '**/node_modules/**', 1);
  if (chem.length) {
    return chem[0].fsPath;
  }
  const lab = await vscode.workspace.findFiles('**/build.lab', '**/node_modules/**', 1);
  return lab[0]?.fsPath;
}

/**
 * Compile the given source file via terminal
 */
export function compileInTerminal(lspPath: string, sourcePath: string, terminal?: vscode.Terminal) {
  const term = terminal || vscode.window.createTerminal('Chemical Build');
  term.show(true);
  const cmd = `${lspPath} cc "${sourcePath}" -o main.exe`;
  term.sendText(cmd);
}

/**
 * Run the compiled executable via terminal
 */
export function runInTerminal(executable: string = 'main.exe', terminal?: vscode.Terminal) {
  const term = terminal || vscode.window.createTerminal('Chemical Run');
  term.show(true);
  // On Windows, execute directly; on *nix you might need `./`
  const cmd = process.platform === 'win32' ? `"${executable}"` : `./${executable}`;
  term.sendText(cmd);
}

export async function compileAndRunCommand(lspPath : string) {
    const ws = vscode.workspace.workspaceFolders?.[0];
    if (!ws) {
      return vscode.window.showErrorMessage('Open a folder first.');
    }

    const src = await findSourceFile();
    if (!src) {
      return vscode.window.showErrorMessage('No chemical.mod or build.lab found.');
    }

    // Reuse same terminal for both
    const terminal = vscode.window.createTerminal('Chemical Workflow');
    compileInTerminal(lspPath, src, terminal);
    // chain run after compile by sending `&&`
    // Alternatively, user presses Run button separately
    terminal.sendText(process.platform === 'win32'
      ? `if %ERRORLEVEL%==0 main.exe`
      : `if [ $? -eq 0 ]; then ./main.exe; fi`
    );
}

export function getConfiguredLspPath(defaultLspPath : string) { 
  // Read default path from extension bundle, allow override
  const config = vscode.workspace.getConfiguration('chemical');
  const configured = config.get<string>('compilerPath');
  return configured || defaultLspPath;
}