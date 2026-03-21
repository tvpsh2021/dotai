#!/bin/bash

# Read stdin (Cursor passes session info as JSON)
input=$(cat)

agents_file="$HOME/.codex/AGENTS.md"

if [ ! -f "$agents_file" ]; then
  echo '{ "continue": true }'
  exit 0
fi

cat <<EOF
{
  "additional_context": $(printf "# Global Rules from AGENTS.md\n\n" | cat - "$agents_file" | jq -Rs .),
  "continue": true
}
EOF
