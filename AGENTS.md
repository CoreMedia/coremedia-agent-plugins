# AGENTS Guide for coremedia-agent-plugins

## Repository purpose

This repository provides CoreMedia application skills and references that help route tasks to the correct CMCC-13 service guidance.

## Primary sources

Use these as the first and authoritative sources:

1. `skills/apps/*/SKILL.md` for routing, scope, and execution pattern.
2. `skills/apps/*/references/specification.md` for detailed behavior and constraints.

If they differ, prefer the skill-local specification and call out the mismatch.

## Intent-to-skill routing

| Intent / target area | Skill |
| --- | --- |
| CAE runtime behavior, rendering, CAE config | `skills/apps/cm-cae` |
| CAE Feeder indexing and feed pipeline behavior | `skills/apps/cm-cae-feeder` |
| Content Server runtime, schema, repository configuration | `skills/apps/cm-content-server` |
| Content Feeder behavior and indexing flow | `skills/apps/cm-content-feeder` |
| Elastic Worker background processing behavior | `skills/apps/cm-elastic-worker` |
| Headless Server APIs and runtime behavior | `skills/apps/cm-headless-server` |
| Solr schema/config and search backend behavior | `skills/apps/cm-solr` |
| Studio Client UI behavior and frontend workspace config | `skills/apps/cm-studio-client` |
| Studio Server backend APIs and editorial service behavior | `skills/apps/cm-studio-server` |
| User Changes service behavior and activity tracking | `skills/apps/cm-user-changes` |
| Workflow Server behavior and workflow runtime | `skills/apps/cm-workflow-server` |

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

