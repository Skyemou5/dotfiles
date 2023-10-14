#unbind (and rebind) default fzf search key
bind -r '\C-T'
bind -x '"\ef":"fzf"'

bind -x '"\er":"$HOME/.bash/scripts/fzfgrep.sh"'
