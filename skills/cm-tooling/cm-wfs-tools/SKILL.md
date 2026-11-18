---
name: cm-wfs-tools
description: "Use this skill when the user is asking for a workflow tooling."
---
The wfs-tools, or workflow server tool is providing the following capabilities
* the relative path in the workspace to the tools is 'apps/workflow-server/modules/cmd-tools/wfs-tools-application/target/wfs-tools/bin'
* If the target directory does not exist, build the tools first. The tools are built via maven, by executing 'mvn clean install' in the folder 'apps/workflow-server/modules/cmd-tools/wfs-tools-application'
* import workflow definitions via the command line tool 'cm' and the action 'upload'
* list running processes via the command line tool 'cm' and the action 'processes'
* Convert outdated processes via the command line tool 'cm' and the action 'workflowconverter'
* per default, the flag for the user is -u and for the password -p
* A default installation has the username 'admin' and the password 'admin'