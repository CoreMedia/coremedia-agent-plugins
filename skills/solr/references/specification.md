# Solr — Specification

## Purpose

Provides the Solr search engine configuration and container image used as
a search backend for content indexing in the Blueprint, as an alternative
to Elasticsearch. Feeder components (e.g. cae-feeder) index into this Solr
instance when the workspace is configured to use Solr.

## Modules

| Module | Purpose |
|---|---|
| `modules/search/solr-config` | Solr schema/config sets defining indexed fields and analyzers |
| `solr-image` | Maven module that builds the Solr Docker image bundling `solr-config` |

## Notes

- This app has no Spring Boot deployable under `spring-boot/`; it produces
  a Solr configuration and a container image instead.
- There is no `modules/extensions/` mechanism for this app — it is
  configuration/image-only, not a pluggable Java service. To change
  indexing behavior, edit the schema/config under
  `modules/search/solr-config` directly and rebuild `solr-image`.
