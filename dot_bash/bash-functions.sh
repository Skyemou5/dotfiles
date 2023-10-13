#arbitrary functions
function surface() {
	file=$(mktemp)
	local line
	while IFS= read -r line; do
		echo "$line" >>"$file"
	done

	gnome-text-editor "$file"
	exit 0
}

function extract-sentences() {
	sd "\. " ".\n"
}

function manswitch() {
	man $1 | less -p "^ +$2"
}

function list-installed-apps() {
	comm -13 \
	<(cat $(echo "$HOME/.static/stockapps.txt" | envsubst) | sort -u) \
	<(compgen -c | rg "\w" | sort -u) \
	| sort -ru | fzf
}

function list-npm-global() {
	npm list --global --parseable --depth=0 |
		sed '1d' |
		rev |
		cut -d "/" -f 1 |
		rev
}

function list-cargo-global() {
	cargo install --list | rg -v "^\w" | sd " " "" | sort -u
}
