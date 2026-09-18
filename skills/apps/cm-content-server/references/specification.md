# Content Server — Specification

## Scope in CMCC-13

The content-server is the authoritative repository backend in CoreMedia
Blueprint. It stores content, metadata, users, and relations, and exposes the
server-side APIs consumed by other applications.

It runs as one of three profiles from one codebase:

- **content-management-server** (default) — editorial repository used by
  Studio and preview.
- **master-live-server** (`mvn spring-boot:run -Pmls`) — publication target
  that live content is replicated from.
- **replication-live-server** (`mvn spring-boot:run -Prls`) — read replica
  of the master-live-server used to scale live delivery.

## Collaborates with

- `cae` and `headless-server` for delivery.
- `studio-server`/`studio-client` for editorial operations.
- `workflow-server` for workflow execution.
- `content-feeder` and `cae-feeder` for indexing.

## Modules

| Module | Purpose |
|---|---|
| `modules/server/contentserver-blueprint-component` | Blueprint content model and server configuration |
| `modules/server/doctypes` | Document type schema definitions |
| `modules/ecommerce/ec-doctypes` | E-commerce-related document types |
| `modules/cmd-tools/mls-tools-application` | CLI tools for the master-live-server |
| `modules/cmd-tools/rls-tools-application` | CLI tools for the replication-live-server |
| `modules/cmd-tools/cms-tools-application` | CLI tools for the content-management-server |

## Optional extensions

Located under `modules/extensions/`: `p13n`, `am`, `lc`, `catalog`, `es`.

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

When changing repository behavior, verify whether it impacts all profiles
(CMS/MLS/RLS) or only one profile, and adjust profile-specific configuration
accordingly.

## Boundaries

- Do not implement delivery rendering here (`cae`).
- Do not implement Studio UI here (`studio-client`).
- Do not place search schema/config here (`solr` or feeder modules).

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

