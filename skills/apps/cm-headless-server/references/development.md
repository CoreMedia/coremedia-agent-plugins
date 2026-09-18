# Headless server development 

## Generic information
- The headless server is a spring boot application which is used to provide content as json representation.
- The technology used is graphql.
- spring-graphql is used.
- The core implementation is located in the workspace under apps/headless-server/modules/headless-server/headless-server-base
- The core graphql definition is located in the workspace under apps/headless-server/modules/headless-server/headless-server-base/src/main/resources/content-schema.graphql
- Extensions can define additional graphql definitions.
- The implementation is following the document type definitions. Consider to read the skill "cm-content-server"

## Specialties
- The way, graphql works was modified. It now knows type inheritance.

## Implementation
- Some extensions are offering an additional *Root.java class, which is defining a query root.
- The queries implementation is defined in the *Root.java class