# Workflow Server — Specification

## Scope in CMCC-13

The workflow-server executes CoreMedia workflows (for example approval,
synchronization, and translation). It coordinates workflow state and process
execution across repository and editorial service boundaries.

## Runtime

- `spring-boot/workflow-server-app` (`mvn spring-boot:run`)

## Collaborates with

- `content-server` for content/workflow data.
- `studio-server` and `studio-client` for workflow interaction.
- integrations triggered by workflow transitions.

## Modules

| Module | Purpose |
|---|---|
| `modules/server/workflowserver-blueprint-component` | Workflow process definitions and Blueprint-specific logic |
| `modules/shared/workflow-lib` | Shared workflow library code used by workflow-server and Studio |
| `modules/cmd-tools/wfs-tools-application` | CLI administration tools for the workflow server |

## Optional extensions

Located under `modules/extensions/`: `p13n`, `lc`.

## Extension and change guidance

Optional features live as modules under `modules/extensions/<name>/` and are
registered in this app's `modules/extension-config` module (an
`*-extensions-bom` and `*-extension-dependencies` pom). Extensions are
managed with the CoreMedia Extension Tool, run from the workspace's
`workspace-configuration/extensions` directory (or with
`-f workspace-configuration/extensions`):

- `mvn extensions:list-extension-points -q` — list extension points this app exposes.
- `mvn extensions:list -q` — list available/active extensions.
- `mvn extensions:sync -Ddisable=<extension>` — disable an extension.
- `mvn extensions:sync -Dremove=<extension>` — remove an extension.
- `mvn extensions:help` — full command reference, including how to add/activate an extension.

To add a new capability: create a module under `modules/extensions/<name>/`,
wire it into this app's extension-config bom/dependencies pom, then run
`mvn extensions:sync` from `workspace-configuration/extensions` to reconcile
the workspace.

When adding workflows, verify transitions, permissions, and rollback/error
paths end-to-end from Studio interaction to repository state.

## Boundaries

- Do not implement Studio UI concerns here (`studio-client`).
- Do not use workflow-server for repository schema modeling (`content-server`).