# Content Feeder — Specification

## Purpose

The content-feeder indexes content from the content-management-server's
repository into Elasticsearch. This powers search-driven features on the
content-management side, most notably CoreMedia Studio's content search,
in the same way cae-feeder powers CAE rendering.

## Modules

| Module | Purpose |
|---|---|
| `modules/search/content-feeder-blueprint-component` | Indexing pipeline and Elasticsearch document mapping for repository content |

## Deployable

- `spring-boot/content-feeder-app`
  - Run: `mvn spring-boot:run`

## Optional extensions

Located under `modules/extensions/`: `corporate`, `am`, `lc`, `catalog`,
`ecommerce-adapter`, `ai-semantic-search`, `validators`, `lc-asset`.

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
