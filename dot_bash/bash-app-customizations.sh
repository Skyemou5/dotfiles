#fff
f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

export FFF_HIDDEN=1

#bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export BAT_PAGER="less"

#fzf

export FZF_DEFAULT_OPTS="
-m --height 100%
--preview 'bat -n --color=always {}'
--preview-window hidden
--bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | xclip -r -sel c)'
--bind 'ctrl-p:toggle-preview'
--bind 'ctrl-l:clear-query'
--bind 'ctrl-s:clear-selection'
--bind 'ctrl-a:toggle-all'
"

# Preview fzf file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_TMUX_OPTS='-p80%,60%'

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#tmux split pane for fzf
export FZF_TMUX=1

_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}

#nnn (TUI file manager)
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='t:preview-tui;p:preview-tabbed;x:!| tmsu tags "$nnn";q:hard-quit'
export NNN_ICONLOOKUP=1
#export NNN_PLUG='t:preview-tui;p:preview-tabbed;x:tmsu-tag-plug'

function n() {
	# Block nesting of nnn in subshells
	[ "${NNNLVL:-0}" -eq 0 ] || {
		echo "nnn is already running"
		return
	}

	# The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
	# If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
	# see. To cd on quit only on ^G, remove the "export" and make sure not to
	# use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
	#      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

	# Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
	# stty start undef
	# stty stop undef
	# stty lwrap undef
	# stty lnext undef

	# The command builtin allows one to alias nnn to n, if desired, without
	# making an infinitely recursive alias

	#take ad-hoc args for 'n', but also incorporate defaults (as one would with an alias)

	ext_args=("${@}")
	ext_args+=(-A)
	ext_args+=(-H)
	ext_args+=(-x)

	command nnn "$ext_args"

	[ ! -f "$NNN_TMPFILE" ] || {
		. "$NNN_TMPFILE"
		rm -f "$NNN_TMPFILE" >/dev/null
	}
}

nnn_cd() {
	if ! [ -z "$NNN_PIPE" ]; then
		printf "%s\0" "0c${PWD}" ! >"${NNN_PIPE}" &
	fi
}

trap nnn_cd EXIT

#ripgrep / rg
RIPGREP_CONFIG_PATH="$HOME/.config/rg/rg.conf"

#zoxide
eval "$(zoxide init bash)"

#broot
source $HOME/.config/broot/launcher/bash/br

#walk
function lk {
	cd "$(walk "$@")"
}

#rustup
source "$HOME/.cargo/env"

#atuin stuff
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

#choose ONE eval below

# normal Bind - borth ctrl-r AND up arrow
#eval "$(atuin init bash)"

# Bind ctrl-r but not up arrow
#eval "$(atuin init bash --disable-up-arrow)"

# Bind up-arrow but not ctrl-r
eval "$(atuin init bash --disable-ctrl-r)"

#cheat
export CHEAT_USE_FZF=true

# if [[ ! $USER == ma* ]]; then
  # starship prompt + other stuff
  # eval "$(starship init bash)"
# fi

eval "$(starship init bash)"

#expose thefuck 'fuck' alias
eval $(thefuck --alias)

# added for npm-completion https://github.com/Jephuff/npm-bash-completion
# PATH_TO_NPM_COMPLETION="/usr/local/bin/../lib/node_modules/npm-completion"
# source $PATH_TO_NPM_COMPLETION/npm-completion.sh

# enables and bootstraps nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#picom-trans stuff

# if command -v picom-trans &> /dev/null; then
#   picom-trans -n "kitty" 92
# fi

#alacritty completions
source ~/.bash_completion/alacritty
