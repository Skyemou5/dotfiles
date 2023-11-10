#unbind (and rebind) default fzf search key
bind -r '\C-T'
bind -r '\C-G'
#bind -x '"\C-f":"fzf"'

bind -x '"\C-G":"$HOME/.bash/scripts/fzfgrep.sh"'
#bind -x '"\ec":"cd $(fd -t d | fzf)"'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-insert '"\e.": yank-last-arg'
