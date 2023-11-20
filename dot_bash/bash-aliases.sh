#debian
alias update='sudo apt update && sudo apt upgrade -y'
#gnome
alias open='xdg-open'
alias lock='swaylock -f -c 000000'
alias screenlock='xdg-screensaver lock'
#common / core
alias off='shutdown -h now'
alias zsh='SHELL=/usr/bin/zsh; zsh'
alias p='pushd'
alias toss='trash-put'
alias less='less -NR'
alias xargs='xargs '
alias edit="$EDITOR"
alias mv='mv --backup=numbered'
#apps
alias mirror='rsync -avz --delete --human-readable --progress --stats'
alias mirror-dry='rsync -avzn --delete --human-readable --progress --stats'
alias gte='gnome-text-editor'
alias text='gnome-text-editor'
alias dust='dust -r'
alias lsfuse='duf -all -only-fs fuse.pathfs.pathInode'
alias fzf='fzf-tmux -p 65%,75% -m --layout=reverse'
alias nnn='nnn -Ax'
alias chime='aplay /usr/share/sounds/speech-dispatcher/xylofon.wav &>/dev/null'
alias veracrypt='veracrypt -t'
alias howdoi='howdoi --color'
alias tldr='tldr -t ocean'
alias brncdu='br -s --sort-by-size'
alias brls='br -sdp'
alias nvitop='pipx run nvitop -m full --colorful'
alias ls='lsd -1'
alias lt='lsd --tree'
alias sk='sk-tmux -m -r'
alias skgrep="sk --ansi -i -c 'grep -rI --color=always --line-number \"{}\" .' | sd \":.*\" \"\""
alias skack="sk --ansi -i -c 'ack --color \"{}\"' | sd \":.*\" \"\""
alias skag="sk --ansi -i -c 'ag --color \"{}\"' | sd \":.*\" \"\""
alias skrg="sk --ansi -i -c 'rg --color=always --line-number \"{}\"' | sd \":.*\" \"\""
alias ncdu="ncdu --show-itemcount"
alias cast='asciinema rec --overwrite'
alias svim='vim -u ~/.SpaceVim/vimrc'
#wayland
alias hyproff='hyprctl dispatch dpms off'
alias wclip='wl-copy'
alias wpaste='wl-paste'
#chezmoi aliases
alias chezwrite='EDITOR=$EDITOR chezmoi \edit --apply'
alias cw='chezwrite'
alias cm='chezmoi'
alias cma='chezmoi add'
alias cmra='chezmoi re-add'
alias cmap='chezmoi apply'
alias cmfg='chezmoi forget'
alias cmcd='chezmoi cd'
alias cmdf='chezmoi diff'
alias cmm='chezmoi managed'
alias cmu='chezmoi update'
#git aliases
alias gi='git init'
alias gcf='git config'
alias gclo='git clone'
alias gra='git remote add'
alias grr='git remote remove'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gdu='git diff @{upstream}'
alias ga='git add'
alias gr='git restore'
alias gc='git commit'
alias grs='git reset'
alias grss='git reset --soft'
alias grsh='git reset --hard'
alias gst='git stash'
alias gstl='git stash list'
alias gsta='git stash apply'
alias gcln='git clean'
alias gclnf='git clean -f'
alias gm='git merge'
alias gco='git checkout'
alias gsw='git switch'
alias gt='git tag'
alias gtd='git tag --delete'
alias gf='git fetch'
alias gp='git push'
alias gpf='git push -f'
alias gpa='git push --all'
alias gpt='git push --tags'
alias gpu='git push -u origin HEAD'
alias gpl='git pull'
alias grbi='git rebase -i'
