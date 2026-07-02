import * as vscode from 'vscode';
import { Task, TaskDefinition, TaskGroup, TaskRevealKind, TaskPanelKind, ProcessExecution } from 'vscode';
import * as fs from 'fs';
import * as path from 'path';
import * as os from 'os';


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
 * Build flags from extension settings
 */
export function getBuildFlags(): string[] {
  const flags: string[] = [];
  const mode = vscode.workspace.getConfiguration('chemical').get<string>('build.mode', 'debug');
  if (mode) flags.push('--mode', mode);
  const noCache = vscode.workspace.getConfiguration('chemical').get<boolean>('build.noCache', false);
  if (noCache) flags.push('--no-cache');
  const pluginMode = vscode.workspace.getConfiguration('chemical').get<string>('build.pluginMode', '');
  if (pluginMode) flags.push('--plugin-mode', pluginMode);
  const recompilePlugins = vscode.workspace.getConfiguration('chemical').get<boolean>('build.recompilePlugins', true);
  if (recompilePlugins) flags.push('-frecompile-plugins');
  return flags;
}

/**
 * Get output path from settings or generate temporary
 */
export function getOutputPath(): string {
  const customOutput = vscode.workspace.getConfiguration('chemical').get<boolean>('build.customOutput', false);
  if (customOutput) {
    const outputPath = vscode.workspace.getConfiguration('chemical').get<string>('build.outputPath', '');
    if (outputPath) return outputPath;
  }
  return path.join(os.tmpdir(), `chemical_build_${Date.now()}.exe`);
}

/**
 * Compile the given source file via terminal (configure - build only)
 */
/**
 * Build a terminal command string that works across shells (PowerShell, CMD, bash).
 * PowerShell requires the `&` call operator when an executable path is quoted.
 */
export function buildTerminalCommand(execPath: string, args: string[]): string {
  let execStr: string;
  if (execPath.includes(' ')) {
    // Path contains spaces — needs quoting
    if (process.platform === 'win32') {
      const shell = (vscode.env.shell || '').toLowerCase();
      if (shell.endsWith('powershell.exe') || shell.endsWith('pwsh.exe')) {
        execStr = `& "${execPath}"`; // PowerShell: & "path"
      } else {
        execStr = `"${execPath}"`; // CMD: "path"
      }
    } else {
      execStr = `"${execPath}"`; // Unix shells: "path"
    }
  } else {
    // No spaces — no quoting needed, works in all shells
    execStr = execPath;
  }
  return `${execStr} ${args.join(' ')}`;
}

export function compileInTerminal(lspPath: string, sourcePath: string, terminal?: vscode.Terminal) {
  const term = terminal || vscode.window.createTerminal('Chemical Build');
  term.show(true);
  const flags = getBuildFlags();
  const outputPath = getOutputPath();
  const args = ['cc', `"${sourcePath}"`, '-o', `"${outputPath}"`, ...flags];
  const cmd = buildTerminalCommand(lspPath, args);
  term.sendText(cmd);
}

/**
 * Run the build file via terminal (compile + execute)
 */
export function runInTerminal(lspPath: string, sourcePath: string, terminal?: vscode.Terminal) {
  const term = terminal || vscode.window.createTerminal('Chemical Run');
  term.show(true);
  const flags = getBuildFlags();
  const outputPath = getOutputPath();
  const args = ['run', `"${sourcePath}"`, '-o', `"${outputPath}"`, ...flags];
  const cmd = buildTerminalCommand(lspPath, args);
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

const CHEMICAL_TYPE = 'chemical';

export function registerChemicalTasks(context: vscode.ExtensionContext, lspPath: string) {
  context.subscriptions.push(
    vscode.tasks.registerTaskProvider(CHEMICAL_TYPE, {
      provideTasks: async () => {
        const wsFolder = vscode.workspace.workspaceFolders?.[0]?.uri.fsPath;
        if (!wsFolder) return [];

        // === Dynamically determine source file ===
        const modPath = path.join(wsFolder, 'chemical.mod');
        const labPath = path.join(wsFolder, 'build.lab');
        const sourceFile = fs.existsSync(modPath) ? modPath : labPath;
        const isModUsed = fs.existsSync(modPath);

        const flags = getBuildFlags();
        const outputPath = getOutputPath();

        // === Build Task (configure) ===
        const buildDef: vscode.TaskDefinition = { type: CHEMICAL_TYPE, task: 'build' };
        const buildExec = new vscode.ProcessExecution(
          lspPath,
          ['cc', sourceFile, '-o', outputPath, ...flags],
          { cwd: wsFolder }
        );
        const buildTask = new vscode.Task(
          buildDef,
          vscode.TaskScope.Workspace,
          'Configure Chemical',
          'chemical',
          buildExec,
          ['$gcc']
        );
        buildTask.group = vscode.TaskGroup.Build;
        buildTask.presentationOptions = {
          reveal: vscode.TaskRevealKind.Always,
          panel: vscode.TaskPanelKind.Shared,
          close: false
        };

        // === Run Task ===
        const runDef: vscode.TaskDefinition = { type: CHEMICAL_TYPE, task: 'run' };
        const runExec = new vscode.ProcessExecution(
          lspPath,
          ['run', sourceFile, '-o', outputPath, ...flags],
          { cwd: wsFolder }
        );
        const runTask = new vscode.Task(
          runDef,
          vscode.TaskScope.Workspace,
          'Run Chemical',
          'chemical',
          runExec
        );
        runTask.group = vscode.TaskGroup.Test;
        runTask.presentationOptions = {
          reveal: vscode.TaskRevealKind.Always,
          panel: vscode.TaskPanelKind.New,
          close: false
        };

        return [buildTask, runTask];
      },

      resolveTask(_task) {
        return undefined;
      }
    })
  );
}