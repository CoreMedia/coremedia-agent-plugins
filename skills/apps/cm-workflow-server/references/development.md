# Workflow-server development
This file is describing on how to implement workflows, where to find the necessary information to perform any task.

## Definition
1. Read the documentation inside the workspace folder .cm-ai/workflows/development.md
2. if the file is not present, read *fully* the documentation https://documentation.coremedia.com/cmcc-13/artifacts/2512.1/webhelp/workflow-developer-en/content/Introduction.html
3. Create a summary in the workspace folder .cm-ai/workflows/development.md, that you remember all key facts
4. Proceed with reading.

## Available workflows
The blueprint workspace already contains some workflows. To understand the structure (definition), read the 
specifications located in the following folders or dependencies:
- Translation workflow -> apps/workflow-server/modules/cmd-tools/wfs-tools-application/src/main/app/properties/corem/workflows/translation.xml
- Synchronization workflow -> com.coremedia.cms:translate-workflow.jar
In essence, the CoreMedia definitions are following the bpmn2 notation with some differences.

## Implementing a new workflow
- Read the documentation https://documentation.coremedia.com/cmcc-13/artifacts/2512.1/webhelp/workflow-developer-en/content/ProgrammingOwnExtensions.html
- In .cm-ai create a folder called "workflows"
- Save non-task specific information and documentation aspects in the workspace document .cm-ai/workflows/development.md which are helpful for the next task

## CMCC workflow basics
- Workflow definitions are XML process definitions (`<Workflow><Process ...>`) using CoreMedia workflow tasks and conditions.
- Common task types: `AutomatedTask`, `UserTask`, `If`, and `Switch`.
- Process-level variables are declared up front and used by assignments/actions.
- `InitialAssignment` defines fields writable when creating a workflow instance.
- `Assignment` sections define read/write variable access for process/task context.

## Blueprint workspace references
- Default translation workflow in this workspace:
    - `apps/workflow-server/modules/cmd-tools/wfs-tools-application/src/main/app/properties/corem/workflows/translation.xml`
- Workflow-server extensions are wired with:
    - `apps/workflow-server/modules/extensions/*`
    - `apps/workflow-server/modules/extension-config/workflow-server-extension-dependencies/pom.xml`
    - `apps/workflow-server/modules/extension-config/workflow-server-extensions-bom/pom.xml`

## Practical implementation pattern
- Create a custom extension module under `apps/workflow-server/modules/extensions`.
- Mark extension artifact with `<coremedia.project.extension.for>workflow-server</coremedia.project.extension.for>`.
- Place custom workflow XML under extension resources (for example: `src/main/resources/properties/corem/workflows`).
- Add extension artifact to `workflow-server-extension-dependencies` as runtime dependency.
- Add artifact to `workflow-server-extensions-bom` dependencyManagement.

