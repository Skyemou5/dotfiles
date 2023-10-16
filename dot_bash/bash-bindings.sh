#unbind (and rebind) default fzf search key
bind -r '\C-T'
bind -x '"\ef":"fzf"'

bind -x '"\er":"$HOME/.bash/scripts/fzfgrep.sh"'
#bind -x '"\ec":"cd $(fd -t d | fzf)"'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-insert '"\e.": yank-last-arg'
