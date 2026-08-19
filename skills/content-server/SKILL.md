---
name: content-server
description: The content-server is the core CoreMedia CMS repository that stores and manages all content, running as a content-management, master-live, or replication-live server profile. Use when working on, extending, or debugging the content-server application in a CoreMedia Blueprint workspace.
---

# Content Server

The content-server is the heart of the CoreMedia CMS: the repository that
stores and manages all content (documents, assets, links, workflows,
users). It runs under one of three profiles from the same codebase.

## Architecture

- `modules/server`
  - `contentserver-blueprint-component` — Blueprint content model/config
  - `doctypes` — document type definitions
- `modules/ecommerce/ec-doctypes` — e-commerce-related document types
- `modules/extensions/*` — optional feature modules (see below)
- `modules/cmd-tools`: `mls-tools-application`, `rls-tools-application`,
  `cms-tools-application` — CLI admin tools per server profile
- `spring-boot/content-server-app` — the deployable Spring Boot
  application, supporting three run profiles

## Running

```
mvn spring-boot:run            # content-management-server (default)
mvn spring-boot:run -Pmls      # master-live-server
mvn spring-boot:run -Prls      # replication-live-server
```

## Optional extensions

Available under `modules/extensions/`: p13n, am, lc, catalog, es.

See `references/specification.md` for the full extension mechanism and
deeper module details.
