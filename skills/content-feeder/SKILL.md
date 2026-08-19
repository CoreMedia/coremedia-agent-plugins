---
name: content-feeder
description: The content-feeder indexes content-server repository content into search (Elasticsearch), powering search features like Studio search, analogous to cae-feeder but for the content-management side. Use when working on, extending, or debugging the content-feeder application in a CoreMedia Blueprint workspace.
---

# Content Feeder

The content-feeder indexes content-server repository content into
Elasticsearch, powering search features on the content-management side
(notably CoreMedia Studio's content search), analogous to how cae-feeder
indexes for the CAE.

## Architecture

- `modules/search/content-feeder-blueprint-component` — indexing/mapping
  logic for the content-management repository
- `modules/extensions/*` — optional feature modules (see below)
- `spring-boot/content-feeder-app` — the deployable Spring Boot application

## Running

```
mvn spring-boot:run     # from spring-boot/content-feeder-app
```

## Optional extensions

Available under `modules/extensions/`: corporate, am, lc, catalog,
ecommerce-adapter, ai-semantic-search, validators, lc-asset.

See `references/specification.md` for the full extension mechanism and
deeper module details.
