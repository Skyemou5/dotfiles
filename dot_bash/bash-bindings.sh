#unbind (and rebind) default fzf search key
bind -r '\C-T'
bind -r '\C-G'
# bind -r '\C-O'
# bind -r '\C-I'
# bind -r '\M-L'
#bind -x '"\C-f":"fzf"'

# bind -x '"\C\e-L":"clear"'
bind -x '"\C-G":"$HOME/.scripts/fzfgrep.sh"'
#bind -x '"\ec":"cd $(fd -t d | fzf)"'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-insert '"\e.": yank-last-arg'
