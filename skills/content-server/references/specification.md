# Content Server — Specification

## Purpose

The content-server is the repository server at the core of the CoreMedia
CMS: it stores and manages all content and serves it to the CAE,
content-feeder, Studio, and other apps. It runs as one of three profiles
from a single codebase:

- **content-management-server** (default) — editorial repository used by
  Studio and preview.
- **master-live-server** (`mvn spring-boot:run -Pmls`) — publication target
  that live content is replicated from.
- **replication-live-server** (`mvn spring-boot:run -Prls`) — read replica
  of the master-live-server used to scale live delivery.

## Modules

| Module | Purpose |
|---|---|
| `modules/server/contentserver-blueprint-component` | Blueprint content model and server configuration |
| `modules/server/doctypes` | Document type schema definitions |
| `modules/ecommerce/ec-doctypes` | E-commerce-related document types |
| `modules/cmd-tools/mls-tools-application` | CLI tools for the master-live-server |
| `modules/cmd-tools/rls-tools-application` | CLI tools for the replication-live-server |
| `modules/cmd-tools/cms-tools-application` | CLI tools for the content-management-server |

## Deployable

- `spring-boot/content-server-app`
  - Content-management-server: `mvn spring-boot:run`
  - Master-live-server: `mvn spring-boot:run -Pmls`
  - Replication-live-server: `mvn spring-boot:run -Prls`

## Optional extensions

Located under `modules/extensions/`: `p13n`, `am`, `lc`, `catalog`, `es`.

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
