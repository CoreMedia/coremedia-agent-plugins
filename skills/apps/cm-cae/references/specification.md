# CAE — Specification

## Scope in CMCC-13

The Content Application Engine (CAE) is the server-side rendering layer for
Blueprint sites. It serves:

- **Live** traffic for public visitors.
- **Preview** traffic for editors in Studio.

It is responsible for composition and rendering, not for repository
persistence or index ingestion.

## Runtime variants

- `spring-boot/cae-live-app` (live)
- `spring-boot/cae-preview-app` (preview)

Both variants share core modules and differ by profile-specific wiring and
dependencies.

## Collaborates with

- `content-server` for CMS content access.
- `cae-feeder` plus search backend (`solr` or Elasticsearch) for indexed
  retrieval scenarios.
- `studio-server`/Studio preview workflows for editorial preview integration.

## Modules

| Module | Purpose |
|---|---|
| `modules/cae/cae-base-lib` | Shared rendering utilities/base classes |
| `modules/cae/cae-base-component` | Shared Spring configuration/component wiring |
| `modules/cae/cae-live-blueprint-component` | Live-site view/controller layer |
| `modules/cae/cae-preview-blueprint-component` | Preview-site view/controller layer |
| `modules/cae/cae-sitemap` | XML sitemap generation |
| `modules/cae/cae-management` | Management/health/actuator endpoints |
| `modules/shared/link-services` | URL/link building used by both live and preview |
| `modules/extension-config` | `cae-extensions-bom`, `cae-extension-dependencies`, `preview-cae-extension-dependencies` — wire optional extensions into live/preview builds |

## Optional extensions

Located under `modules/extensions/`:

`corporate`, `p13n`, `am`, `lc`, `lc-p13n`, `alx`, `alx-p13n`, `alx-google`,
`lc-es`, `es`, `ecommerce-adapter`, `campaigns`, `lc-asset`.

Each extension is registered via the `modules/extension-config` boms
(`cae-extensions-bom`, `cae-extension-dependencies`,
`preview-cae-extension-dependencies`), which determine what's compiled into
the live and preview apps respectively.

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

Before changing CAE behavior, verify whether the change belongs in:

- `cae-live-blueprint-component` / `cae-preview-blueprint-component` (rendering)
- `link-services` (URL strategy)
- a dedicated extension module (optional feature)

## Boundaries

- Do not model repository schema here; that belongs to `content-server`.
- Do not implement Studio client UX here; use `studio-client`.
- Do not treat CAE as a headless API; use `headless-server` for that use case.

## Documentation
- `../../../cm-documentation/SKILL.md`
