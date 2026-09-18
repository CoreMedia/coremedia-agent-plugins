# Studio Server — Specification

## Scope in CMCC-13

The studio-server is the backend service for CoreMedia Studio editorial
workflows. It exposes APIs for content operations, search, taxonomy/theme,
workflow interaction, and integrations.

It is also one of the most extensible Blueprint services, with a large set of
optional modules.

## Runtime

- `spring-boot/studio-server-app` (`mvn spring-boot:run`)

## Collaborates with

- `studio-client` as primary consumer.
- `workflow-server` for workflow execution paths.
- `content-server` for repository-backed operations.
- feeder/search services for search-backed features.

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

## Optional extensions

Located under `modules/extensions/`: `p13n`, `custom-topic-pages`, `am`,
`lc`, `catalog`, `workflows`, `lc-es`, `ecommerce-adapter`, `taxonomy`,
`ai-semantic-search`, `validators`, `es`, `notification-elastic`,
`lc-asset`.

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

When introducing new Studio-facing APIs, keep contracts stable for
`studio-client` and verify permissions/workflow implications.

## Boundaries

- Do not implement Studio browser UI here (`studio-client`).
- Do not implement workflow engine internals here (`workflow-server`).

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

