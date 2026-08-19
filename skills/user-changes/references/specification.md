# User Changes — Specification

## Purpose

The user-changes app tracks content changes made by individual users
(editors) in the content-server and reports them, supporting features such
as notifying editors of recent activity or auditing who changed what.

## Modules

| Module | Purpose |
|---|---|
| `modules/server/user-changes-blueprint-component` | Change tracking, aggregation, and reporting logic |

## Deployable

- `spring-boot/user-changes-app`
  - Run: `mvn spring-boot:run`

## Optional extensions

Located under `modules/extensions/`: `notification-elastic`.

## Extending this app

Optional features live as modules under `modules/extensions/<name>/` and are
registered in this app's `modules/extension-config` module (an
`*-extensions-bom` and `*-extension-dependencies` pom). Extensions are
managed with the CoreMedia Extension Tool, run from the workspace's
`workspace-configuration/extensions` directory (or with
`-f workspace-configuration/extensions`):

- `mvn extensions:list-extension-points -q` — list extension points this app exposes.
- `mvn extensions:list -q` — list available/active extensions.
- `mvn extensions:sync -Ddisable=<extension>` — disable an extension.
- `mvn extensions:sync -Dremove=<extension>` — remove an extension.
- `mvn extensions:help` — full command reference, including how to add/activate an extension.

To add a new capability: create a module under `modules/extensions/<name>/`,
wire it into this app's extension-config bom/dependencies pom, then run
`mvn extensions:sync` from `workspace-configuration/extensions` to reconcile
the workspace.
