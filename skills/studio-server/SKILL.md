---
name: studio-server
description: The studio-server is the backend for CoreMedia Studio, the editorial UI, providing REST APIs, workflow, taxonomy, and theme services and hosting the largest set of Blueprint extensions. Use when working on, extending, or debugging the studio-server application in a CoreMedia Blueprint workspace.
---

# Studio Server

The studio-server is the backend for CoreMedia Studio, the browser-based
editorial application. It provides REST APIs and services consumed by the
studio-client frontend: content operations, workflows, taxonomy/theme
management, e-commerce integration, and search.

## Architecture

- `modules/studio/studio-blueprint-component` — core Studio REST APIs and
  Blueprint-specific services
- `modules/ecommerce`: `ec-common`, `ec-studio-lib` — e-commerce
  integration for Studio
- `modules/shared`: `theme-importer`, `taxonomies` — shared theme and
  taxonomy support
- `modules/cmd-tools`: `theme-importer-application`, `theme-importer-lib`
  — CLI tooling for importing themes
- `modules/extensions/*` — optional feature modules (see below); this app
  has the largest extension set in the Blueprint
- `spring-boot/studio-server-app` — the deployable Spring Boot application

## Running

```
mvn spring-boot:run     # from spring-boot/studio-server-app
```

## Optional extensions

Available under `modules/extensions/`: p13n, custom-topic-pages, am, lc,
catalog, workflows, lc-es, ecommerce-adapter, taxonomy,
ai-semantic-search, validators, es, notification-elastic, lc-asset.

See `references/specification.md` for the full extension mechanism and
deeper module details.
