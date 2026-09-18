---
name: cm-content-feeder
description: "Use this skill for CoreMedia CMCC-13 content-feeder work: repository indexing for Studio-side search, mapping logic, and feeder extension wiring."
---

# Content Feeder

In CMCC-13 Blueprint projects, content-feeder indexes repository content for
content-management use cases, especially Studio search and related
search-driven editorial features.

## Use this skill when

- You change indexing behavior for Studio-facing repository search.
- You update document mapping or feeder transformation logic.
- You debug missing or stale search results in content-management contexts.

## Hand off to other skills when

- The issue is delivery-side index behavior: use `cae-feeder`.
- The issue is search engine schema/image config: use `solr` when Solr-backed.
- The issue is repository model/content persistence: use `content-server`.

## Key paths

- `modules/search/content-feeder-blueprint-component`
- `spring-boot/content-feeder-app`

## Run mode

- `mvn spring-boot:run` from `spring-boot/content-feeder-app`

## References

- Local spec: `references/specification.md`
- CoreMedia docs location: `../../cm-documentation/SKILL.md`
