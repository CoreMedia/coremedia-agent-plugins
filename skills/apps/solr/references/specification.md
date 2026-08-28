# Solr — Specification

## Scope in CMCC-13

This app packages Solr configuration for Blueprint indexing scenarios where
Solr is selected as backend. It provides schema/config sets and the Solr image
used by deployment.

It does not implement feeder business logic; it defines search backend
behavior.

## Collaborates with

- `cae-feeder` and/or `content-feeder` as index writers.
- Search consumers in delivery/editorial services.

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

## Change guidance

- Keep schema/config changes aligned with feeder-side mappings.
- Validate backward compatibility for existing indexed data before rollout.

## Boundaries

- Do not implement feeder event/mapping logic here.
- Do not place CoreMedia repository model changes here.

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

