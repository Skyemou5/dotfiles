#environment variables
PAGER='/usr/bin/less'

#EDITOR='nano -lP'

#find best editor available
if command -v lvim &> /dev/null; then
  VISUAL='lvim'
elif command -v nvim &> /dev/null; then
  VISUAL='nvim'
elif command -v vim &> /dev/null; then
  VISUAL='vim'
else
  VISUAL='nano'
fi

EDITOR="$VISUAL"

#TERMINAL for i3-sensible-terminal
TERMINAL='/usr/bin/kitty'
