#!/usr/bin/env zsh


skills=(
  cm-blueprint-apps
  cm-documentation
  cm-cae
  cm-cae-feeder
  cm-content-server
  cm-content-feeder
  cm-elastic-worker
  cm-headless-server
  cm-solr
  cm-studio-client
  cm-studio-server
  cm-user-changes
  cm-workflow-server
  cm-tooling
  cm-cms-tools
  cm-wfs-tools
  cm-service-api
  cm-ingest-server
)

for s in "${skills[@]}"; do
  gh skill install . "$s" --from-local --agent github-copilot --scope user --force
done

echo ""
echo "Global Copilot skills now present in ~/.copilot/skills:"
ls -1 ~/.copilot/skills | cat