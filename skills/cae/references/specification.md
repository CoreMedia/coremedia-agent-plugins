# CAE — Specification

## Purpose

The Content Application Engine (CAE) is the rendering tier of the CoreMedia
Blueprint. It queries the content-server (directly or via caches) and
renders both:

- the **live** website, served to end users, and
- the **preview** website, served to editors in CoreMedia Studio for
  what-you-see-is-what-you-get review of unpublished content.

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

## Deployables

- `spring-boot/cae-live-app` — live Spring Boot application
  - Run: `mvn spring-boot:run`
  - Image: `mvn -Pdefault-image` (optionally `-Djib.goal=build`)
- `spring-boot/cae-preview-app` — preview Spring Boot application
  - Run: `mvn spring-boot:run`
  - Image: `mvn -Pdefault-image` (optionally `-Djib.goal=build`)

## Optional extensions

Located under `modules/extensions/`:

`corporate`, `p13n`, `am`, `lc`, `lc-p13n`, `alx`, `alx-p13n`, `alx-google`,
`lc-es`, `es`, `ecommerce-adapter`, `campaigns`, `lc-asset`.

Each extension is registered via the `modules/extension-config` boms
(`cae-extensions-bom`, `cae-extension-dependencies`,
`preview-cae-extension-dependencies`), which determine what's compiled into
the live and preview apps respectively.

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
