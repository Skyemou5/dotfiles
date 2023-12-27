#!/bin/bash

# enter chezmoi repo to run git commands
cd ~/.local/share/chezmoi

# icon="🔲"
alt="default"
tooltip="chezmoi repo is not committed, and / or has not been pushed to remote"

# ensure local is committed and upstream is identical to local
# in essence; ensure all changes are committed, but also PUSHED
if [[ -z $(git status --porcelain) && -z $(git diff @{u}) ]]; then
  # icon="☑️"
  alt="success"
  tooltip="chezmoi repo is up to date"
fi

# conventional output
# echo "$icon\n$tooltip"

#JSON output
printf '{"alt": "%s", "tooltip": "%s"}\n' "$alt" "$tooltip"
