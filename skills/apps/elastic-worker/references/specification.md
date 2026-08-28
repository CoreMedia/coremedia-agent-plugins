# Elastic Worker — Specification

## Scope in CMCC-13

The elastic-worker executes asynchronous Elasticsearch-related jobs as a
dedicated worker process. It is designed for long-running or bursty workloads
that should not block request/response services.

## Runtime

- `spring-boot/elastic-worker-app` (`mvn spring-boot:run`)

## Collaborates with

- `content-feeder` and `cae-feeder` pipelines.
- `studio-server` and other backend services that enqueue background work.
- Elasticsearch infrastructure.

## Modules

| Module | Purpose |
|---|---|
| `modules/elastic-worker/elastic-worker-blueprint-component` | Job/task definitions and Elasticsearch integration |

## Optional extensions

Located under `modules/extensions/`: `lc-es`, `es`.

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

If tasks stall or fail, verify queue/task orchestration, index permissions,
and backend connectivity before changing business logic.

## Boundaries

- Do not implement user-facing rendering/UI behavior here.
- Do not use this app as the primary place for feeder mapping decisions.

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

