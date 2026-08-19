# Headless Server — Specification

## Purpose

The headless-server exposes content-server content over a headless
delivery API (JSON/GraphQL-style), for consumption by frontends other than
the CAE (single-page apps, mobile apps, third-party integrations). Like
the CAE, it has separate live and preview variants so editors can preview
unpublished content through the same headless API shape used in
production.

## Modules

| Module | Purpose |
|---|---|
| `modules/headless-server/headless-server-base` | Core headless query/API layer |
| `modules/headless-server/json-preview-client` | Preview-mode JSON client support |

## Deployable

- `spring-boot/headless-server-app`
  - Preview: `mvn spring-boot:run`
  - Live: `mvn spring-boot:run -Plive`

## Optional extensions

Located under `modules/extensions/`: `p13n`, `catalog`, `ec-augmentation`.

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
