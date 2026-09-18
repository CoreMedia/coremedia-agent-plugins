---
name: cm-user-changes
description: "Use this skill for CoreMedia CMCC-13 user-changes work: tracking editorial content changes, activity reporting, and notification-related extension wiring."
---

# User Changes

In CMCC-13 Blueprint projects, user-changes records and exposes editorial
change activity for use cases like activity feeds, notifications, and audit
visibility.

## Use this skill when

- You change tracking/aggregation logic for editorial change events.
- You integrate or debug notification-related change feeds.
- You work on user-changes extension behavior.

## Hand off to other skills when

- The issue is repository persistence/modeling: use `content-server`.
- The issue is Studio UI presentation: use `studio-client`.
- The issue is notification indexing backend behavior: use `elastic-worker`
  or `solr` as appropriate.

## Key paths

- `modules/server/user-changes-blueprint-component`
- `spring-boot/user-changes-app`

## Run mode

- `mvn spring-boot:run` from `spring-boot/user-changes-app`

## References

- Local spec: `references/specification.md`
- CoreMedia docs location: `../../cm-documentation/SKILL.md`
