#unbind (and rebind) default fzf search key
bind -r '\C-T'
bind -x '"\ef":"fzf"'

bind -x '"\es":"$HOME/.bash/scripts/fzfgrep.sh"'
#bind -x '"\ec":"cd $(fd -t d | fzf)"'

