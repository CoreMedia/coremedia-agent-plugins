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
- Everything related to the headless development `references/development.md`

## Development
### Generic information
- The headless server is a spring boot application which is used to provide content as json representation.
- The technology used is graphql.
- spring-graphql is used.
- The core implementation is located in the workspace under apps/headless-server/modules/headless-server/headless-server-base
- The core graphql definition is located in the workspace under apps/headless-server/modules/headless-server/headless-server-base/src/main/resources/content-schema.graphql
- Extensions can define additional graphql definitions.
- The implementation is following the document type definitions. Consider to read the skill "cm-content-server"
- Never change existing extensions, always ask with an option

### Specialties
- The implementation of graphql is modified in the workspace. It now knows inheritance.

### Implementation
- Some extensions are offering an additional java class, which is defining a query root.
- @QueryMapping is always returning a class, which has the implementation for all queries. Check the ContentRootController if available for more details.
- The queries implementation is defined in a java class which is returned by the @QueryMapping. Create a standalone class, not a static inner class.
- There is only one @QueryMapping per extension.
- Do not create any @Qualifier("graphqlSchemaResource") schema resource bindings, it's already present.
- If necessary, create a "org.springframework.boot.autoconfigure.AutoConfiguration.imports" file for the spring auto-configuration.