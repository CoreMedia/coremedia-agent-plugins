---
name: workflow-server
description: The workflow-server executes CoreMedia content workflows and business processes, such as approval and translation workflows. Use when working on, extending, or debugging the workflow-server application in a CoreMedia Blueprint workspace.
---

# Workflow Server

The workflow-server executes content workflows and business processes for
the Blueprint — for example approval workflows and translation workflows —
orchestrating steps across content-server, Studio, and integrated systems.

## Architecture

- `modules/server/workflowserver-blueprint-component` — workflow process
  definitions and Blueprint-specific workflow logic
- `modules/shared/workflow-lib` — shared workflow library code
- `modules/cmd-tools/wfs-tools-application` — CLI administration tools
- `modules/extensions/*` — optional feature modules (see below)
- `spring-boot/workflow-server-app` — the deployable Spring Boot
  application

## Running

```
mvn spring-boot:run     # from spring-boot/workflow-server-app
```

## Optional extensions

Available under `modules/extensions/`: p13n, lc.

See `references/specification.md` for the full extension mechanism and
deeper module details.
