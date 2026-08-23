#!/bin/bash
# ================================================
# Claude Codeに`sudo`を実行させない楽観的ガード
# https://code.claude.com/docs/en/hooks-guide
# ================================================

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$COMMAND" | grep -qP '\bsudo\b'; then
  echo "Blocked: command matches protected pattern 'sudo'" >&2
  exit 2
fi

exit 0
