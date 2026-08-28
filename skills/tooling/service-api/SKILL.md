---
name: Service-api
description: "Use this skill for executing the service api"
---

# Service API
The CMCC service api is used to:
- List coremedia environments
- Retrieve container properties
- Retrieve container-images properties for a given environment
- Retrieve container-configurations for a given environment
- Retrieve containers for a given environment
- List container properties for a given environment
- Get the exact container property for a given environment and property name
- Ability to set a container property for a given environment and property name

## Execution
- Deployment calls are never executed. Only information retrieval is allowed.
- For deployment requests, print out the curl command, but never execute.
- Only GET requests are executed. Always ask if the method differs.
- Check if a folder named ".cm-ai/" exists in the root of the workspace.
- Check if a .cm-ai/cmcc-service-api/.env exists.
- The key of the service token is called SERVICE_API_TOKEN, and the value is the token which must be used.
- The service api is web based, and the token must be passed as Authorization bearer token.
- The service api definition is located in the CoreMedia blueprint workspace in the folder ".cm-ai/cmcc-service-api/openapi.yaml"
- Check if a implementation is located under the folder ".cm-ai/cmcc-service-api/implementation"
- If no implementation is present, generate a client of your choice in the mentioned folder. Always implement all methods.
- You are only allowed to use the client to call endpoints.
- Execute the client and ensure that the client is working as expected.
- Note that before calling endpoints, a durable token via /token must be created and passed.