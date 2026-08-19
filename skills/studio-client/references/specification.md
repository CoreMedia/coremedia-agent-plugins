# Studio Client — Specification

## Purpose

The studio-client is the frontend TypeScript workspace for CoreMedia
Studio, the browser-based editorial application. It talks to the
studio-server backend's REST APIs and renders the editorial UI (content
browsing/editing, workflow UI, search, previews, etc.).

Unlike the other Blueprint apps, it is not a Maven/Java project: it is a
pnpm-managed TypeScript monorepo.

## Toolchain

- Node `^24.11.1`
- pnpm `^10.24.0`
- Workspace layout defined in `pnpm-workspace.yaml`
- Container build via `docker-bake.hcl` and `Dockerfile`

## Structure

| Path | Purpose |
|---|---|
| `apps/main` | Main Studio UI application |
| `apps/workflow` | Studio workflow UI application |
| `shared/js` | Shared TypeScript libraries used across Studio apps |
| `shared/ext` | Shared extension points for customizing the Studio UI |
| `global/studio` | Global Studio-wide configuration/assets |
| `patches/` | pnpm patches applied to third-party dependencies |

## Further reading

For build, dev-server, and testing instructions specific to this
workspace, consult (in the coremedia-blueprints-workspace repo):

- `Studio-TypeScript-Handbook.md`
- `apps/studio-client/README.adoc`

## Extending

1. Add a new package under the appropriate folder (typically
   `shared/ext` for reusable extension points, or a new app under `apps/`
   for a standalone Studio application).
2. Register the new package's path in `pnpm-workspace.yaml` so pnpm picks
   it up as a workspace member.
3. Reference the new package from the `coremedia.projectExtensionWorkspacePaths`
   field in the consuming app's `package.json` (e.g. `apps/main/package.json`)
   so it is wired into that app's build.
4. If the new package patches a third-party dependency, add the patch
   under `patches/` and reference it per pnpm's patch conventions.
