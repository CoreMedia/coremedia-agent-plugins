# Studio Server — Specification

## Purpose

The studio-server is the backend for CoreMedia Studio (the browser-based
editorial application). It exposes REST APIs consumed by the studio-client
frontend for content operations, workflow initiation, taxonomy/theme
management, e-commerce integration, and search — and carries the largest
set of pluggable extensions of any Blueprint app.

## Modules

| Module | Purpose |
|---|---|
| `modules/studio/studio-blueprint-component` | Core Studio REST APIs and Blueprint-specific services |
| `modules/ecommerce/ec-common` | Shared e-commerce integration code |
| `modules/ecommerce/ec-studio-lib` | E-commerce integration specific to Studio |
| `modules/shared/theme-importer` | Theme import support |
| `modules/shared/taxonomies` | Taxonomy management support |
| `modules/cmd-tools/theme-importer-application` | CLI application for importing themes |
| `modules/cmd-tools/theme-importer-lib` | Library backing the theme-importer CLI |

## Deployable

- `spring-boot/studio-server-app`
  - Run: `mvn spring-boot:run`

## Optional extensions

Located under `modules/extensions/`: `p13n`, `custom-topic-pages`, `am`,
`lc`, `catalog`, `workflows`, `lc-es`, `ecommerce-adapter`, `taxonomy`,
`ai-semantic-search`, `validators`, `es`, `notification-elastic`,
`lc-asset`.

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
