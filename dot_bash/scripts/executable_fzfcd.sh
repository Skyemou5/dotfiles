#!/bin/bash
dir="$(fd -t d | fzf)"
#builtin cd -- "$dir"
cd "$dir"
