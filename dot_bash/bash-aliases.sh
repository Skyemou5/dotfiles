alias open='xdg-open'
alias off='shutdown -h now'
alias update='sudo apt update && sudo apt upgrade -y'
alias screenlock='xdg-screensaver lock'
alias mirror='rsync -az --delete --stats'
alias mirror-dry='rsync -azn --delete --stats'
alias lock='xdg-screensaver lock'
alias veracrypt='veracrypt -t'
alias gte='gnome-text-editor'
alias chime='aplay /usr/share/sounds/speech-dispatcher/xylofon.wav &>/dev/null'
alias text='gnome-text-editor'
alias zsh='SHELL=/usr/bin/zsh; zsh'
alias p='pushd'
alias fzf='fzf-tmux -p 65%,75% -m'
alias nnn='nnn -Ax'
alias toss='trash-put'
alias less='less -NR'
alias dust='dust -r'
alias lsfuse='duf -all -only-fs fuse.pathfs.pathInode'
alias howdoi='howdoi --color'
alias tldr='tldr -t ocean'
alias brncdu='br -s --sort-by-size'
alias brls='br -sdp'
alias nvitop='pipx run nvitop -m full --colorful'
alias ls='lsd -1'
alias lt='lsd --tree'
alias xargs='xargs '
alias sk='sk-tmux -m -r'
alias skgrep="sk --ansi -i -c 'grep -rI --color=always --line-number \"{}\" .' | sd \":.*\" \"\""
alias skack="sk --ansi -i -c 'ack --color \"{}\"' | sd \":.*\" \"\""
alias skag="sk --ansi -i -c 'ag --color \"{}\"' | sd \":.*\" \"\""
alias skrg="sk --ansi -i -c 'rg --color=always --line-number \"{}\"' | sd \":.*\" \"\""
alias edit="$EDITOR"
alias ncdu="ncdu --show-itemcount"
