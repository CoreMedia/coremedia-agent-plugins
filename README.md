# CoreMedia Agent Plugin

This repository is an [Agent Plugin](https://agent-plugins.org) named
**`coremedia-agent-plugins-1-0`** (see `plugin.json`). It bundles a set of
[Agent Skills](https://agentskills.io/specification) — one per application
in the CoreMedia Blueprint workspace (`apps/*` in
`coremedia-blueprints-workspace`) — so that coding agents can quickly
understand what each Blueprint application does, how it's structured, and how to
extend it.

Each skill lives under `skills/apps/cm-<app-name>/SKILL.md`, with deeper reference
material under `skills/apps/cm-<app-name>/references/specification.md`.

## Skills

| Skill | Blueprint app | What it covers |
|---|---|---|
| [`cae`](skills/apps/cm-cae/SKILL.md) | `apps/cae` | Content Application Engine — renders the live/preview website |
| [`cae-feeder`](skills/apps/cm-cae-feeder/SKILL.md) | `apps/cae-feeder` | Feeds/indexes content into the search index the CAE reads from |
| [`content-server`](skills/apps/cm-content-server/SKILL.md) | `apps/content-server` | Core CMS repository server (content-management, master-live, replication-live) |
| [`content-feeder`](skills/apps/cm-content-feeder/SKILL.md) | `apps/content-feeder` | Indexes repository content into search for the content-management side (e.g. Studio search) |
| [`elastic-worker`](skills/apps/cm-elastic-worker/SKILL.md) | `apps/elastic-worker` | Background worker for asynchronous Elasticsearch jobs |
| [`headless-server`](skills/apps/cm-headless-server/SKILL.md) | `apps/headless-server` | Headless delivery API (JSON/GraphQL-style) for non-CAE frontends |
| [`user-changes`](skills/apps/cm-user-changes/SKILL.md) | `apps/user-changes` | Tracks/reports user-driven content changes |
| [`solr`](skills/apps/cm-solr/SKILL.md) | `apps/solr` | Solr search engine configuration and container image |
| [`studio-server`](skills/apps/cm-studio-server/SKILL.md) | `apps/studio-server` | Backend for CoreMedia Studio (REST APIs, workflows, taxonomy/theme services) |
| [`studio-client`](skills/apps/cm-studio-client/SKILL.md) | `apps/studio-client` | TypeScript/pnpm frontend workspace for CoreMedia Studio |
| [`workflow-server`](skills/apps/cm-workflow-server/SKILL.md) | `apps/workflow-server` | Executes content workflows/business processes |

