---
name: studio-server
description: "Use this skill for CoreMedia CMCC-13 studio-server work: Studio backend APIs, editorial service integration, and extension wiring for Studio features."
---

# Studio Server

In CMCC-13 Blueprint projects, studio-server is the backend service layer for
Studio. It exposes APIs used by `studio-client` for content operations,
workflow interaction, search, taxonomy/theme features, and integrations.

## Use this skill when

- You change Studio backend API behavior or editorial service integration.
- You work on taxonomy/theme import, Studio-side e-commerce support, or
  extension modules.
- You debug backend errors seen from Studio UI actions.

## Hand off to other skills when

- The issue is purely client-side Studio UI code: use `studio-client`.
- The issue is workflow engine internals: use `workflow-server`.
- The issue is repository schema/modeling: use `content-server`.

## Key paths

- `modules/studio/studio-blueprint-component`
- `modules/ecommerce/ec-common`, `modules/ecommerce/ec-studio-lib`
- `modules/shared/theme-importer`, `modules/shared/taxonomies`
- `modules/cmd-tools/theme-importer-application`,
  `modules/cmd-tools/theme-importer-lib`
- `spring-boot/studio-server-app`

## Run mode

- `mvn spring-boot:run` from `spring-boot/studio-server-app`

## References

- Local spec: `references/specification.md`
- CMCC docs portal: `../../shared/documentation.md`
