---
name: cm-studio-client
description: "Use this skill for CoreMedia CMCC-13 Studio frontend work: TypeScript workspace structure, pnpm packages, and Studio UI extension wiring."
---

# Studio Client

In CMCC Blueprint projects, studio-client contains the TypeScript
applications and shared packages that implement the Studio editorial UI. It is
managed as a pnpm workspace and talks to `studio-server` APIs.

## Use this skill when

- You change Studio UI components, views, or extension packages.
- You add workspace packages or update package wiring.
- You debug client-side integration with `studio-server` endpoints.

## Hand off to other skills when

- The issue is backend API/workflow service behavior: use `studio-server` or
  `workflow-server`.
- The issue is repository schema/content persistence: use `content-server`.

## Toolchain and structure

- Node version, the node version is defined in the used workspace the user is working on. The relevant information is stored in the document apps/studio-client/README.adoc
- pnpm version, the pnpm version is defined in the used workspace the user is working on. The relevant information is stored in the document apps/studio-client/README.adoc
- Workspace file: `pnpm-workspace.yaml`
- Main paths: `apps/main`, `apps/workflow`, `shared/js`, `shared/ext`,
  `global/studio`, `patches`

## Toolchain validation
If the user is not running the correct pnpm or node version, please print out the relevant versions, and ask the user to switch to the correct version. The relevant information is stored in the document apps/studio-client/README.adoc
Use 'node -v' to check the node version and 'pnpm -v' to check the pnpm version.

## Extension workflow

- Add package code under the appropriate workspace folder.
- Register the package in `pnpm-workspace.yaml`.
- Wire it into consuming apps via
  `coremedia.projectExtensionWorkspacePaths`.

## References

- Local spec: `references/specification.md`
- CoreMedia docs location: `../../cm-documentation/SKILL.md`
