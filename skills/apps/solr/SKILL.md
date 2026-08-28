---
name: solr
description: "Use this skill for CoreMedia CMCC-13 Solr work: search schema/config-set maintenance and Solr image packaging used by feeder pipelines."
---

# Solr

In CMCC-13 Blueprint stacks that use Solr, this app defines Solr schema and
config sets plus the Solr container image consumed by feeder applications.
It is configuration/image packaging, not a Spring Boot runtime service.

## Use this skill when

- You change indexed fields, analyzers, or collections/core config.
- You need to rebuild the Solr image after schema/config changes.
- You troubleshoot Solr-side index/query behavior.

## Hand off to other skills when

- The issue is feeder mapping/event flow: use `cae-feeder` or `content-feeder`.
- The issue is delivery rendering: use `cae`.
- The issue is repository-side content modeling: use `content-server`.

## Key paths

- `modules/search/solr-config`
- `solr-image`

## References

- Local spec: `references/specification.md`
- CMCC docs portal: `../../shared/documentation.md`
