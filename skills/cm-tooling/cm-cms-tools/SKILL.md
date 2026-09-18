---
name: cm-cms-tools
description: "Use this skill when the user is asking for a specific tooling."
---

# CMS tools
The cms tools are providing the ability to export or import content.

# Specification
- The cms-tools are located in the folder `apps/content-server/modules/cmd-tools/cms-tools-application/target/cms-tools`. If the folder does not exists, the user need to build the tools.
- within the `bin` directory, there is an executable called 'cm'.
- For content export use  "cm serverexport"
- For content import use "cm serverimport"
- it is possible to define multiple parameters. By invoking either the serverexport or serverimport, the parameters are printed out. 
- Please also check the capclient.properties file. It is possible to define an url for the endpoint
- Ensure that the provided port is reused.
- per default use parameters -uadmin and -padmin for username and password