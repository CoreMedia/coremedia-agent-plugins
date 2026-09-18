---
name: cm-content-server
description: "Use this skill for CoreMedia CMCC-13 content-server work: repository schema, content model, server profiles (CMS/MLS/RLS), and server-side extension wiring."
---

# Content Server

In CMCC-13 Blueprint projects, the content-server is the CMS repository and
core content API backend. It stores editorial data and serves content to
Studio, CAE/headless delivery, workflows, and feeder pipelines.

## Use this skill when

- You change content types, schema, repository-level configuration, or
  repository-side APIs.
- You debug profile-specific behavior for content-management-server,
  master-live-server, or replication-live-server.
- You work on server-side extension modules touching repository behavior.

## Hand off to other skills when

- The issue is HTML rendering: use `cae`.
- The issue is Studio frontend code: use `studio-client`.
- The issue is indexing pipelines or search mapping: use `content-feeder`,
  `cae-feeder`, or `solr`.

## Key paths

- `modules/server/contentserver-blueprint-component`
- `modules/server/doctypes`
- `modules/ecommerce/ec-doctypes`
- `modules/cmd-tools/mls-tools-application`,
  `modules/cmd-tools/rls-tools-application`,
  `modules/cmd-tools/cms-tools-application`
- `spring-boot/content-server-app`

## Run profiles

- Content-management-server (default): `mvn spring-boot:run`
- Master-live-server: `mvn spring-boot:run -Pmls`
- Replication-live-server: `mvn spring-boot:run -Prls`

## References

- Local spec: `references/specification.md`
- CoreMedia docs location: `../../cm-documentation/SKILL.md`
