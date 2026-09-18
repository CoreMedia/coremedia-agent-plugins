# Content Feeder — Specification

## Scope in CMCC-13

The content-feeder indexes repository content for content-management use
cases. Its primary consumers are Studio-side search features and associated
editorial workflows.

Compared with `cae-feeder`, this app focuses on content-management indexing
rather than delivery-side indexing.

## Runtime

- `spring-boot/content-feeder-app` (`mvn spring-boot:run`)

## Collaborates with

- `content-server` as repository source.
- `studio-server`/`studio-client` as search consumers.
- Elasticsearch infrastructure (or alternative backend setup in custom stacks).

## Modules

| Module | Purpose |
|---|---|
| `modules/search/content-feeder-blueprint-component` | Indexing pipeline and Elasticsearch document mapping for repository content |

## Optional extensions

Located under `modules/extensions/`: `corporate`, `am`, `lc`, `catalog`,
`ecommerce-adapter`, `ai-semantic-search`, `validators`, `lc-asset`.

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

When search quality changes, review mapping and analysis choices first, then
confirm feeder event flow and re-index state.

## Boundaries

- Do not implement repository schema here (`content-server`).
- Do not implement Studio UI behavior here (`studio-client`).
- Do not use this app for CAE delivery indexing (`cae-feeder`).

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

