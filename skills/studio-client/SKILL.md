---
name: studio-client
description: The studio-client is the TypeScript frontend workspace for the CoreMedia Studio editorial UI, built with pnpm workspaces rather than Maven. Use when working on, extending, or debugging the studio-client (Studio TypeScript) application in a CoreMedia Blueprint workspace.
---

# Studio Client

The studio-client is the frontend for CoreMedia Studio, the editorial UI.
Unlike the other Blueprint apps, it is not a Maven/Java project — it is a
TypeScript workspace managed with pnpm, targeting the studio-server backend.

## Toolchain

- Node `^24.11.1`, pnpm `^10.24.0`
- Package/workspace management via `pnpm-workspace.yaml`
- Container build via `docker-bake.hcl` / `Dockerfile`

## Architecture

- `apps/main` — the main Studio UI application
- `apps/workflow` — the Studio workflow UI application
- `shared/js` — shared TypeScript libraries used across Studio apps
- `shared/ext` — shared extension points for customizing Studio UI
- `global/studio` — global Studio-wide configuration/assets
- `patches/` — pnpm patches applied to third-party dependencies

See the workspace's own `Studio-TypeScript-Handbook.md` and `README.adoc`
for detailed build/dev instructions.

## Extending

Add new packages/extensions by:

1. Creating the package under the appropriate workspace folder (e.g.
   `shared/ext`).
2. Registering its path in `pnpm-workspace.yaml`.
3. Referencing it in the `coremedia.projectExtensionWorkspacePaths` field
   of the relevant app's `package.json` (e.g. `apps/main/package.json`).

See `references/specification.md` for more detail.
