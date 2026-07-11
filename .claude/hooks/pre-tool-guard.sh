#!/bin/bash
# PreToolUse hook — blocks dangerous Bash and PowerShell commands before execution

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -qE "terraform destroy|terraform apply.*-auto-approve|aws s3 rm|aws s3 rb|Remove-Item.*-Recurse|Remove-Item.*-Force"; then
  echo '{"decision": "block", "reason": "Destructive command detected. Use controlled commands for infrastructure changes."}'
fi