# Workflow Server — Specification

## Purpose

The workflow-server executes CoreMedia content workflows — business
processes such as content approval or translation workflows — coordinating
steps across the content-server, Studio, and other integrated systems.

## Modules

| Module | Purpose |
|---|---|
| `modules/server/workflowserver-blueprint-component` | Workflow process definitions and Blueprint-specific logic |
| `modules/shared/workflow-lib` | Shared workflow library code used by workflow-server and Studio |
| `modules/cmd-tools/wfs-tools-application` | CLI administration tools for the workflow server |

## Deployable

- `spring-boot/workflow-server-app`
  - Run: `mvn spring-boot:run`

## Optional extensions

Located under `modules/extensions/`: `p13n`, `lc`.

## Extending this app

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
