# Installing the CoreMedia agent plugins

This guide explains how to install the skills from
[`CoreMedia/coremedia-agent-plugins`](https://github.com/CoreMedia/coremedia-agent-plugins)
into **Claude Code**, **GitHub Copilot**, and **OpenAI Codex**.

The repository is published as a plugin marketplace named `coremedia-agent-plugins`
(`.claude-plugin/marketplace.json`) containing one plugin, `coremedia-blueprint`.

| Agent | Mechanism |
| --- | --- |
| Claude Code | Plugin marketplace |
| GitHub Copilot CLI | Plugin marketplace |
| OpenAI Codex | Skill installer from GitHub + `AGENTS.md` |

## Prerequisites

- Access to `https://github.com/CoreMedia/coremedia-agent-plugins`
  (internal repository — authenticate with `gh auth login` first).
- The agent CLI you want to use, installed and logged in.

## Included skills

| Group | Skills |
| --- | --- |
| Applications | `cm-blueprint-apps`, `cm-cae`, `cm-cae-feeder`, `cm-content-server`, `cm-content-feeder`, `cm-elastic-worker`, `cm-headless-server`, `cm-solr`, `cm-studio-client`, `cm-studio-server`, `cm-user-changes`, `cm-workflow-server` |
| Tooling / APIs | `cm-tooling`, `cm-cms-tools`, `cm-wfs-tools`, `cm-ingest-api`, `cm-service-api` |
| Documentation | `cm-documentation` |

---

## 1. Claude Code

### Install

Run inside Claude Code:

```text
/plugin marketplace add CoreMedia/coremedia-agent-plugins
/plugin install coremedia-blueprint@coremedia-agent-plugins
```

Restart Claude Code so the skills are loaded.

### Verify

- Run `/plugin` and check that `coremedia-blueprint` is listed as installed.
- Skills appear with the plugin prefix, e.g. `coremedia-blueprint:cm-documentation`.

### Update / remove

```text
/plugin marketplace update coremedia-agent-plugins
/plugin uninstall coremedia-blueprint@coremedia-agent-plugins
```

---

## 2. GitHub Copilot CLI

### Install

From the shell:

```bash
copilot plugin marketplace add CoreMedia/coremedia-agent-plugins
copilot plugin install coremedia-blueprint@coremedia-agent-plugins
```

Or inside an interactive Copilot CLI session:

```text
/plugin marketplace add CoreMedia/coremedia-agent-plugins
/plugin install coremedia-blueprint@coremedia-agent-plugins
```

Restart Copilot CLI so the skills are loaded.

### Verify

```bash
copilot plugin list
```

`coremedia-blueprint` should be listed as installed.

### Update / remove

```bash
copilot plugin marketplace update coremedia-agent-plugins
copilot plugin uninstall coremedia-blueprint
```

---