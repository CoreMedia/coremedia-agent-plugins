---
name: elastic-worker
description: The elastic-worker executes asynchronous Elasticsearch-related background jobs and tasks (e.g. re-indexing) offloaded from other Blueprint servers. Use when working on, extending, or debugging the elastic-worker application in a CoreMedia Blueprint workspace.
---

# Elastic Worker

The elastic-worker is a background worker that executes asynchronous
Elasticsearch-related jobs and tasks for the Blueprint (e.g. re-indexing,
elastic social processing), offloading this work from the content-server,
CAE, and Studio server so they stay responsive.

## Architecture

- `modules/elastic-worker/elastic-worker-blueprint-component` — job/task
  definitions and Elasticsearch integration
- `modules/extensions/*` — optional feature modules (see below)
- `spring-boot/elastic-worker-app` — the deployable Spring Boot application

## Running

```
mvn spring-boot:run     # from spring-boot/elastic-worker-app
```

## Optional extensions

Available under `modules/extensions/`: lc-es, es.

See `references/specification.md` for the full extension mechanism and
deeper module details.
