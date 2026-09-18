# Headless Server — Specification

## Scope in CMCC-13

The headless-server provides a headless delivery API for Blueprint content.
It serves non-CAE channels and integrations that consume structured responses
instead of server-rendered HTML.

Preview and live variants support editorial review and production delivery
with consistent API semantics.

## Runtime variants

- Preview: `mvn spring-boot:run`
- Live: `mvn spring-boot:run -Plive`

## Collaborates with

- `content-server` for source content.
- `studio-server`/Studio preview flows for editorial validation.
- Frontend applications that consume headless payloads.

## Modules

| Module | Purpose |
|---|---|
| `modules/headless-server/headless-server-base` | Core headless query/API layer |
| `modules/headless-server/json-preview-client` | Preview-mode JSON client support |

## Optional extensions

Located under `modules/extensions/`: `p13n`, `catalog`, `ec-augmentation`.

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

Before changing API shapes, verify compatibility expectations of consuming
frontends and preview tooling.

## Boundaries

- Do not implement template-driven HTML rendering here (`cae`).
- Do not modify repository schema/modeling here (`content-server`).

