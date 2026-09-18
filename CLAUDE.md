# CLAUDE Guide for coremedia-agent-plugins

## Repository purpose

This repository provides CoreMedia application skills and references that help route tasks to the correct CMCC-13 service guidance.

## Primary sources

Use these as the first and authoritative sources:

1. `skills/apps/*/SKILL.md` for routing, scope, and execution pattern.
2. `skills/apps/*/references/specification.md` for detailed behavior and constraints.

If they differ, prefer the skill-local specification and call out the mismatch.

## Intent-to-skill routing

| Intent / target area | Skill entrypoint | Detailed reference |
| --- | --- | --- |
| CAE runtime behavior, rendering, CAE config | `skills/apps/cm-cae/SKILL.md` | `skills/apps/cm-cae/references/specification.md` |
| CAE Feeder indexing and feed pipeline behavior | `skills/apps/cm-cae-feeder/SKILL.md` | `skills/apps/cm-cae-feeder/references/specification.md` |
| Content Server runtime, schema, repository configuration | `skills/apps/cm-content-server/SKILL.md` | `skills/apps/cm-content-server/references/specification.md` |
| Content Feeder behavior and indexing flow | `skills/apps/cm-content-feeder/SKILL.md` | `skills/apps/cm-content-feeder/references/specification.md` |
| Elastic Worker background processing behavior | `skills/apps/cm-elastic-worker/SKILL.md` | `skills/apps/cm-elastic-worker/references/specification.md` |
| Headless Server APIs and runtime behavior | `skills/apps/cm-headless-server/SKILL.md` | `skills/apps/cm-headless-server/references/specification.md` |
| Solr schema/config and search backend behavior | `skills/apps/cm-solr/SKILL.md` | `skills/apps/cm-solr/references/specification.md` |
| Studio Client UI behavior and frontend workspace config | `skills/apps/cm-studio-client/SKILL.md` | `skills/apps/cm-studio-client/references/specification.md` |
| Studio Server backend APIs and editorial service behavior | `skills/apps/cm-studio-server/SKILL.md` | `skills/apps/cm-studio-server/references/specification.md` |
| User Changes service behavior and activity tracking | `skills/apps/cm-user-changes/SKILL.md` | `skills/apps/cm-user-changes/references/specification.md` |
| Workflow Server behavior and workflow runtime | `skills/apps/cm-workflow-server/SKILL.md` | `skills/apps/cm-workflow-server/references/specification.md` |

## Operating checklist

1. Identify the target app/service.
2. Read the matching `skills/apps/cm-<name>/SKILL.md`.
3. Read `skills/apps/cm-<name>/references/specification.md`.
4. Propose the smallest viable change for the stated intent.
5. Explicitly call out required handoffs to other skills or teams.

## Guardrails

- Do not invent runtime details, defaults, ports, flags, or version-specific behavior.
- When uncertain, prefer and cite referenced CMCC-13 documentation from skill references.
- Keep assumptions explicit and minimal.

