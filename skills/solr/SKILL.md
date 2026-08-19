---
name: solr
description: Solr provides the Solr search engine configuration and container image used as a search backend for content indexing in a CoreMedia Blueprint workspace (an alternative to Elasticsearch). Use when working on, extending, or debugging the solr search configuration or image.
---

# Solr

The `solr` app is not a Java/Spring Boot application. It provides the Solr
search engine's configuration (schema, config sets) and the Docker image
used to run Solr as the search backend for content indexing, in workspaces
where Solr — rather than Elasticsearch — is configured (e.g. as the
backend consumed by cae-feeder).

## Architecture

- `modules/search/solr-config` — Solr schema and configuration (config
  sets, field definitions) used by feeder components
- `solr-image` — Maven module that builds the Solr Docker image bundling
  the above configuration

## Extending

To change indexing behavior (new fields, analyzers, config sets), edit the
schema/config under `modules/search/solr-config` and rebuild the
`solr-image` module. There is no `modules/extensions/` mechanism here since
this app is configuration/image-only, not a pluggable Java service.

See `references/specification.md` for further detail.
