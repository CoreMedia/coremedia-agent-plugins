# User Changes — Specification

## Scope in CMCC-13

The user-changes app tracks editorial change activity and provides reporting
data for activity feeds, notifications, and audit-oriented visibility.

It focuses on change-event tracking/aggregation, not on content persistence or
UI rendering.

## Runtime

- `spring-boot/user-changes-app` (`mvn spring-boot:run`)

## Collaborates with

- `content-server` as source of editorial changes.
- `studio-server`/`studio-client` for activity presentation scenarios.
- notification/search infrastructure via optional extensions.

## Modules

| Module | Purpose |
|---|---|
| `modules/server/user-changes-blueprint-component` | Change tracking, aggregation, and reporting logic |

## Optional extensions

Located under `modules/extensions/`: `notification-elastic`.

## Extension and change guidance

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

If activity data appears incomplete, validate event ingestion and retention
before changing reporting logic.

## Boundaries

- Do not implement repository schema changes here (`content-server`).
- Do not implement Studio UI components here (`studio-client`).

## CMCC-13 references

- `https://documentation.coremedia.com/cmcc-13/`

