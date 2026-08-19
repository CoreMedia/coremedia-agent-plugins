# CAE Feeder — Specification

## Purpose

The cae-feeder is the indexing pipeline between the content-server and the
CAE. It listens to content-server changes and feeds a search index
(Solr or Elasticsearch, depending on workspace configuration) so that CAE
rendering reads from the fast index rather than the content-server
directly.

## Modules

| Module | Purpose |
|---|---|
| `modules/search/caefeeder-lib` | Core feeder library (indexing pipeline, transformers) |
| `modules/search/caefeeder-blueprint-component` | Blueprint-specific document/index mapping |
| `modules/cmd-tools/caefeeder-tools-application` | CLI tools for administration, e.g. full re-index |

## Deployable

- `spring-boot/cae-feeder-app`
  - Preview: `mvn spring-boot:run`
  - Live: `mvn spring-boot:run -Plive`

## Optional extensions

Located under `modules/extensions/`: `corporate`, `am`, `lc`.

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
