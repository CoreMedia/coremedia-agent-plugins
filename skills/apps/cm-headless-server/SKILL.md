---
name: cm-headless-server
description: "Use this skill for CoreMedia CMCC-13 headless-server work: delivery API behavior, live/preview headless endpoints, and headless extension wiring."
---

# Headless Server

In CMCC-13 Blueprint projects, headless-server exposes content through a
headless delivery API for non-CAE frontends (for example SPAs or mobile
clients). It has live and preview variants aligned with editorial workflows.

## Use this skill when

- You change headless endpoint behavior, payload mapping, or query handling.
- You debug differences between preview and live headless responses.
- You wire optional feature support into headless delivery.

## Hand off to other skills when

- The request is about HTML rendering/templates: use `cae`.
- The issue is repository schema/content persistence: use `content-server`.
- The issue is Studio frontend concerns: use `studio-client`.

## Key paths

- `modules/headless-server/headless-server-base`
- `modules/headless-server/json-preview-client`
- `spring-boot/headless-server-app`

## Run profiles

- Preview: `mvn spring-boot:run`
- Live: `mvn spring-boot:run -Plive`

## References

- Local spec: `references/specification.md`
- CoreMedia docs location: `../../cm-documentation/SKILL.md`

