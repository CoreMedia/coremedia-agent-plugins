---
name: headless-server
description: The headless-server exposes CoreMedia content via a headless delivery API (JSON/GraphQL-style) for non-CAE frontends, with live and preview variants. Use when working on, extending, or debugging the headless-server application in a CoreMedia Blueprint workspace.
---

# Headless Server

The headless-server exposes content-server content through a headless
delivery API (JSON/GraphQL-style), enabling frontends other than the CAE
(e.g. SPAs, mobile apps) to consume Blueprint content. It has separate live
and preview variants, like the CAE.

## Architecture

- `modules/headless-server`
  - `headless-server-base` — core API/query layer
  - `json-preview-client` — preview-mode JSON client support
- `modules/extensions/*` — optional feature modules (see below)
- `spring-boot/headless-server-app` — the deployable Spring Boot
  application, with preview and live run modes

## Running

```
mvn spring-boot:run          # preview
mvn spring-boot:run -Plive   # live
```

## Optional extensions

Available under `modules/extensions/`: p13n, catalog, ec-augmentation.

See `references/specification.md` for the full extension mechanism and
deeper module details.
