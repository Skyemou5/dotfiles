#!/bin/bash

# enter chezmoi repo to run git commands
cd ~/.local/share/chezmoi

# ensure local is committed and upstream is identical to local
# in essence; ensure all changes are committed, but also PUSHED
if [[ -z $(git status --porcelain) && -z $(git diff @{u}) ]]; then
  echo "☑️"
else
  echo "🔲"
fi
