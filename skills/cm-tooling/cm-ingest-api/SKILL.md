---
name: cm-ingest-server
description: "Use this skill for executing the ingest-server api"
---

# Ingest server API
The CMCC ingest-server api is used to:
- Get content information
- Create new Content with given properties. 
- Get blob information for a given content and property name.
- Update a blob information for a given content id and property name.
- Update a content with given id
- Get content by id
- Create a temporary blob.
- withdraw content for a list of ids  
- withdraw content async for a list of ids
- publish content for a list of ids
- publish content async for a list of ids
- delete content for a list of ids
- delete content async for a list of ids
- Get running job status by id

## Execution
- Check if a folder named ".cm-ai/" exists in the root of the workspace.
- Check if a .cm-ai/cmcc-ingest-api/.env exists.
- The key of the ingest token is called <ENVIRONMENT>_TOKEN, and the value is the token which must be used.
- The ingest api is web based, and the token must be passed as Authorization bearer token.
- The ingest api definition is located in the CoreMedia blueprint workspace in the folder ".cm-ai/cmcc-ingest-api/openapi.yaml"
- Check if a implementation is located under the folder ".cm-ai/cmcc-ingest-api/implementation"
- If no implementation is present, generate a client of your choice in the mentioned folder. Always implement all methods.
- You are only allowed to use the client to call endpoints.
- Execute the client and ensure that the client is working as expected.
- If no environment is mentioned, ask for the environment.