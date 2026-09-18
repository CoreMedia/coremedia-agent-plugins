---
name: cm-tooling
description: "Use this skill when the user is asking for a specific tooling. There are also api provided"
---

# Workspace tooling
- Content export and content import operations are located in  `cms-tools/SKILL.md`
- Workflow   `wfs-tools/SKILL.md`

# Api-Tooling
The CoreMedia content cloud is offering two different API's or services

## CMCC service api
- When the user is asking for environment variables, properties, or to set specific values, check if the folder ".cm-ai/cmcc-service-api" exists.
- Within this folder, If there is no file named "openapi.yaml", ask the user to download the specification which is located under the url "https://swagger-api.dior.coremedia.cloud/openapi.yaml"
- For the usage and more background information, use the `service-api/SKILL.md`

## CMCC ingest-service
- When the user is asking to use the ingest-server, check if the folder ".cm-ai/cmcc-ingest-api" exists.
- Within this folder, If there is no file named "openapi.yaml", ask the user to download the specification.
- For the usage and more background information, use the `ingest-api/SKILL.md`