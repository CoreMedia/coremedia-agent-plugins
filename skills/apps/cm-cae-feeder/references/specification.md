# CAE Feeder — Specification

## Scope in CMCC-13

The cae-feeder is the delivery-side indexing pipeline between content-server
and CAE. It listens to content changes and updates the search index that CAE
queries for fast delivery.

Depending on workspace configuration, backend search can be Solr or
Elasticsearch.

## Runtime variants

- Preview feeder: `mvn spring-boot:run`
- Live feeder: `mvn spring-boot:run -Plive`

## Collaborates with

- `content-server` as source of content events/data.
- `cae` as consumer of indexed output.
- `solr` or Elasticsearch infrastructure as target backend.

## Modules

| Module | Purpose |
|---|---|
| `modules/search/caefeeder-lib` | Core feeder library (indexing pipeline, transformers) |
| `modules/search/caefeeder-blueprint-component` | Blueprint-specific document/index mapping |
| `modules/cmd-tools/caefeeder-tools-application` | CLI tools for administration, e.g. full re-index |

## Optional extensions

Located under `modules/extensions/`: `corporate`, `am`, `lc`.

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

When troubleshooting stale or missing CAE output, validate event ingestion,
document mapping, and index alias/collection targets before changing CAE code.

## Boundaries

- Do not modify page rendering logic here (`cae`).
- Do not define repository schema here (`content-server`).

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

