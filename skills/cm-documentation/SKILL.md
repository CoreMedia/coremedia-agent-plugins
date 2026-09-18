# Documentation
CoreMedia is versioned, and depending on the internal version, a mapping exists below to the offical version.

| internal version | external version |
|------------------|------------------|
| 2406             | cmcc-12          |
| 2506             | cmcc-12          |
| 2412             | cmcc-12          |
| 2512             |   cmcc-13 |
| 2612             |   cmcc-13 | 

Depending on the external version, the documentation is located under https://documentation.coremedia.com/<external version>/overview/
Furthermore, there are api descriptions and explanations located under https://documentation.coremedia.com/discover/
The version needs to be retrieved from the workspace the user is working on. each app/<module>/blueprint-parent/pom.xml is holding the version, identified by the property 'cm.common.core.version'