---
name: user-changes
description: The user-changes app tracks and reports user-driven content changes for notification and audit purposes, e.g. surfacing recent editorial activity. Use when working on, extending, or debugging the user-changes application in a CoreMedia Blueprint workspace.
---

# User Changes

The user-changes app tracks and reports content changes made by users
(editors), supporting notification and audit use cases such as showing
editors a feed of recent editorial activity.

## Architecture

- `modules/server/user-changes-blueprint-component` — change tracking and
  reporting logic
- `modules/extensions/*` — optional feature modules (see below)
- `spring-boot/user-changes-app` — the deployable Spring Boot application

## Running

```
mvn spring-boot:run     # from spring-boot/user-changes-app
```

## Optional extensions

Available under `modules/extensions/`: notification-elastic.

See `references/specification.md` for the full extension mechanism and
deeper module details.
