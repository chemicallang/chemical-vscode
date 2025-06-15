import * as vscode from 'vscode';
import { Task, TaskDefinition, TaskGroup, TaskRevealKind, TaskPanelKind, ProcessExecution } from 'vscode';
import * as fs from 'fs';
import * as path from 'path';


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

        // === Build Task ===
        const buildDef: vscode.TaskDefinition = { type: CHEMICAL_TYPE, task: 'build' };
        const exeName = process.platform === 'win32' ? 'main.exe' : 'main';
        const buildExec = new vscode.ProcessExecution(
          lspPath,
          ['cc', sourceFile, '-o', exeName],
          { cwd: wsFolder }
        );
        const buildTask = new vscode.Task(
          buildDef,
          vscode.TaskScope.Workspace,
          'Build Chemical',
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
        const runExec = new vscode.ProcessExecution(path.join(wsFolder, exeName), [], {
          cwd: wsFolder
        });
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

        // Tag run task with file used so we can use it in onDidEndTaskProcess
        (runTask as any).__isModUsed = isModUsed;

        return [buildTask, runTask];
      },

      // Optional — not needed unless tasks.json used
      resolveTask(_task) {
        return undefined;
      }
    })
  );

  // Auto-run after successful build (only if chemical.mod used)
  context.subscriptions.push(
    vscode.tasks.onDidEndTaskProcess(async (e) => {
      const def = e.execution.task.definition;
      if (def.type === CHEMICAL_TYPE && def.task === 'build' && e.exitCode === 0) {
        const wsFolder = vscode.workspace.workspaceFolders?.[0]?.uri.fsPath;
        if (!wsFolder) return;

        const isModUsed = fs.existsSync(path.join(wsFolder, 'chemical.mod'));
        if (!isModUsed) return;

        const tasks = await vscode.tasks.fetchTasks({ type: CHEMICAL_TYPE });
        const run = tasks.find(t => t.definition.task === 'run');
        if (run) vscode.tasks.executeTask(run);
      }
    })
  );
}