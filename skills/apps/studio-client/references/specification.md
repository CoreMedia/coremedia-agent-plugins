# Studio Client — Specification

## Scope in CMCC-13

The studio-client is the frontend workspace for CoreMedia Studio. It renders
the editorial UI and integrates with `studio-server` REST APIs.

Unlike most Blueprint apps, this is a pnpm-managed TypeScript monorepo rather
than a Maven Java service.

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

## Collaborates with

- `studio-server` for backend APIs.
- `workflow-server` through Studio workflow features.
- `content-server` indirectly through backend services.

## Further reading

For build, dev-server, and testing instructions specific to this
workspace, consult (in the coremedia-blueprints-workspace repo):

- `Studio-TypeScript-Handbook.md`
- `apps/studio-client/README.adoc`

## Extension and change guidance

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

When adding Studio features, validate API contracts with `studio-server` and
avoid embedding backend-specific logic in UI components.

## Boundaries

- Do not implement backend service logic here (`studio-server`).
- Do not implement workflow engine behavior here (`workflow-server`).

## Documentation
- `../../../../shared/documentation.md`
