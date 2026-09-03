---
name: workflow-server
description: "Use this skill for CoreMedia CMCC workflow-server work: workflow execution, process definitions, workflow tooling, and workflow-related extension wiring."
---

# Workflow Server

In CMCC-13 Blueprint projects, workflow-server executes editorial workflows
such as approval, synchronization, and translation flows, and it hosts custom
workflow process definitions.

## Use this skill when

- You change workflow process definitions or execution behavior.
- You debug stuck/failed workflow instances.
- You work on workflow-related extension modules or tooling.

## Hand off to other skills when

- The issue is Studio UI workflow interaction only: use `studio-client`.
- The issue is Studio backend API routing only: use `studio-server`.
- The issue is repository schema/content model: use `content-server`.

## Key paths

- `modules/server/workflowserver-blueprint-component`
- `modules/shared/workflow-lib`
- `modules/cmd-tools/wfs-tools-application`
- `spring-boot/workflow-server-app`

## Run mode

- `mvn spring-boot:run` from `spring-boot/workflow-server-app`

## References

- Local spec: `references/specification.md`
- CMCC docs portal: `../../../shared/documentation.md`
