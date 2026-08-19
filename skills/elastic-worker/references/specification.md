# Elastic Worker — Specification

## Purpose

The elastic-worker runs asynchronous, potentially long-running
Elasticsearch-related jobs (re-indexing, elastic social processing, and
similar tasks) as a dedicated worker process, keeping the content-server,
CAE, and Studio server free of this load.

## Modules

| Module | Purpose |
|---|---|
| `modules/elastic-worker/elastic-worker-blueprint-component` | Job/task definitions and Elasticsearch integration |

## Deployable

- `spring-boot/elastic-worker-app`
  - Run: `mvn spring-boot:run`

## Optional extensions

Located under `modules/extensions/`: `lc-es`, `es`.

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
