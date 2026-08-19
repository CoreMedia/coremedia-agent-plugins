---
name: cae-feeder
description: The cae-feeder feeds and indexes content-server content into the search index that the CAE reads from, keeping live/preview rendering fast. Use when working on, extending, or debugging the cae-feeder application in a CoreMedia Blueprint workspace.
---

# CAE Feeder

The cae-feeder listens for content-server changes and indexes the relevant
content into a search index (Solr/Elasticsearch), which the CAE queries at
render time instead of hitting the content-server directly. This keeps
live/preview page rendering fast and scalable.

## Architecture

- `modules/search`
  - `caefeeder-lib` — core feeder library
  - `caefeeder-blueprint-component` — Blueprint-specific indexing logic
- `modules/cmd-tools/caefeeder-tools-application` — command-line
  administration tools (e.g. re-indexing)
- `modules/extensions/*` — optional feature modules (see below)
- `spring-boot/cae-feeder-app` — the deployable Spring Boot application,
  with separate preview and live profiles

## Running

```
mvn spring-boot:run              # preview feeder
mvn spring-boot:run -Plive       # live feeder
```

## Optional extensions

Available under `modules/extensions/`: corporate, am, lc.

See `references/specification.md` for the full extension mechanism and
deeper module details.
