---
name: elastic-worker
description: "Use this skill for CoreMedia CMCC-13 elastic-worker work: asynchronous Elasticsearch job execution, background processing behavior, and related extension wiring."
---

# Elastic Worker

In CMCC-13 Blueprint projects, elastic-worker is a dedicated background
process for asynchronous Elasticsearch-related work. It keeps front-facing and
editorial services responsive by offloading long-running jobs.

## Use this skill when

- You debug failed or delayed asynchronous Elasticsearch jobs.
- You add new worker-side processing tasks.
- You change background processing integration with extension modules.

## Hand off to other skills when

- The issue is feed indexing logic: use `content-feeder` or `cae-feeder`.
- The issue is search schema/config in Solr: use `solr`.
- The issue is Studio UI behavior: use `studio-client`.

## Key paths

- `modules/elastic-worker/elastic-worker-blueprint-component`
- `spring-boot/elastic-worker-app`

## Run mode

- `mvn spring-boot:run` from `spring-boot/elastic-worker-app`

## References

- Local spec: `references/specification.md`
- CMCC docs portal: `../../../shared/documentation.md`
