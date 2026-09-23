---
name: cm-cae
description: Use this skill for CoreMedia CMCC-13 CAE work live/preview rendering, page composition, controller/view logic, and CAE extension wiring.
---

Before doing any analysis, edits, or suggestions, the agent MUST:

1. Locate and read `development.md` in the current workspace (or the path configured by the user).
2. Treat `development.md` as highest-priority local project guidance.
3. If `development.md` is missing or unreadable, stop and ask the user how to proceed.
4. In the first response, explicitly confirm which `development.md` path was read.

Do not continue with implementation until this step is complete.

# CAE (Content Application Engine)

In CMCC-13 Blueprint projects, the CAE is the server-side rendering tier for
the live site and Studio preview. It reads content from CoreMedia services and
renders HTML responses through Blueprint view/controller components.

## Use this skill when

- You add or debug controllers, handlers, models, or Freemarker/JSP views.
- You change live/preview rendering behavior, sitemap behavior, or link
  generation.
- You enable/disable CAE-related extensions via extension-config modules.

## Hand off to other skills when

- The issue is repository/content model persistence: use `content-server`.
- The issue is index feeding/search documents: use `cae-feeder` or `solr`.
- The issue is headless API output rather than HTML rendering: use
  `headless-server`.

## Key paths

- `modules/cae` (`cae-base-lib`, `cae-base-component`,
  `cae-live-blueprint-component`, `cae-preview-blueprint-component`,
  `cae-sitemap`, `cae-management`)
- `modules/shared/link-services`
- `modules/extension-config` (`cae-extensions-bom`,
  `cae-extension-dependencies`, `preview-cae-extension-dependencies`)
- `spring-boot/cae-live-app`, `spring-boot/cae-preview-app`

## Run modes

- Live app: `mvn spring-boot:run` from `spring-boot/cae-live-app`
- Preview app: `mvn spring-boot:run` from `spring-boot/cae-preview-app`
- Image build: `mvn -Pdefault-image` (optionally `-Djib.goal=build`)

## References

- Local spec: `references/specification.md`
