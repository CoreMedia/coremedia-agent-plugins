---
name: cm-documentation
description: Use this skill for the CoreMedia documentation, and queries against a documentation. 
---

# Documentation
- CoreMedia is versioned, and depending on the internal version, a mapping exists below to the offical version.
- Use strict skill-driven execution

| internal version | external version |
|------------------|------------------|
| 2406             | cmcc-12          |
| 2506             | cmcc-12          |
| 2412             | cmcc-12          |
| 2512             |   cmcc-13 |
| 2612             |   cmcc-13 | 


## Steps to follow

### Required steps
- Before executing the prompt, read the documentation in .cm-ai/documentation/findings.md
- Confirm that you did so.
- If the documentation findings.md file does not exist, execute Steps under "Documentation folder" to create the file and read the documentation.

### Documentation folder
- The version needs to be retrieved from the workspace the user is working on. each app/<module>/blueprint-parent/pom.xml is holding the version, identified by the property 'cm.common.core.version'
- Check existence. Create the .cm-ai/documentation folder in the workspace if it does not exist.
- Create the .cm-ai/documentation/findings.md file in the workspace if it does not exist.
- Depending on the external version, the documentation is located under https://documentation.coremedia.com/<external version>/overview/ . Read and put your findings into the findings.md file.
- Read the documentation under the section "Basic Manuals" and remember the documentation names, some are pointing to application documentations. Read the documents and save your understanding in the findings.md file.
- Always document your findings. Don't be specific to the prompt.
- Confirm the step above