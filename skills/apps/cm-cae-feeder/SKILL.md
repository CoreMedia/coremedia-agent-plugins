---
name: cm-cae-feeder
description: "Use this skill for CoreMedia CMCC-13 CAE feeder work: indexing pipeline behavior, feed mappings, live/preview feeder profiles, and feeder extension wiring."
---

# CAE Feeder

In CMCC-13 Blueprint projects, the cae-feeder builds and updates the search
index used by CAE delivery. It reacts to repository changes and writes mapped
documents to the configured search backend.

## Use this skill when

- You change feed mappings, transformation logic, or feeder scheduling.
- You debug index consistency between content-server changes and CAE output.
- You work on full re-index flows or feeder-side extension modules.

## Hand off to other skills when

- The issue is rendering: use `cae`.
- The issue is Solr schema/image itself: use `solr`.
- The issue is repository content model: use `content-server`.

## Key paths

- `modules/search/caefeeder-lib`
- `modules/search/caefeeder-blueprint-component`
- `modules/cmd-tools/caefeeder-tools-application`
- `spring-boot/cae-feeder-app`

## Run profiles

- Preview feeder: `mvn spring-boot:run`
- Live feeder: `mvn spring-boot:run -Plive`

## References

- Local spec: `references/specification.md`
- CoreMedia docs location: `../../cm-documentation/SKILL.md`
