---
name: cae
description: The CAE (Content Application Engine) renders the live and preview website from CoreMedia content-server data. Use when working on, extending, or debugging the cae application in a CoreMedia Blueprint workspace.
---

# CAE (Content Application Engine)

The CAE is the Blueprint's rendering tier: it reads content from the
content-server and renders the public live website and the editorial
preview website.

## Architecture

- `modules/cae`: core libraries and components
  - `cae-base-lib`, `cae-base-component` — shared rendering foundation
  - `cae-live-blueprint-component` — live-site rendering
  - `cae-preview-blueprint-component` — preview-site rendering
  - `cae-sitemap` — sitemap generation
  - `cae-management` — management/actuator endpoints
- `modules/shared/link-services` — link building shared across CAE variants
- `modules/extensions/*` — optional feature modules (see below)
- `modules/extension-config` — `cae-extensions-bom`,
  `cae-extension-dependencies`, `preview-cae-extension-dependencies`
  register which extensions are active
- `spring-boot/cae-live-app`, `spring-boot/cae-preview-app` — the two
  deployable Spring Boot applications

## Running

```
mvn spring-boot:run          # from spring-boot/cae-live-app or cae-preview-app
```

Container image: `mvn -Pdefault-image` (optionally add `-Djib.goal=build`).

## Optional extensions

Available under `modules/extensions/`: corporate, p13n, am, lc, lc-p13n,
alx, alx-p13n, alx-google, lc-es, es, ecommerce-adapter, campaigns,
lc-asset.

See `references/specification.md` for the full extension mechanism and
deeper module details.
