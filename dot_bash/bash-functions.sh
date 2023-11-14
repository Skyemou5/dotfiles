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

function gifasciinema() {
  name=$(echo "$1" | rev | cut -d '.' -f 2- | rev)
  agg --cols 52 --rows 18 --font-size 26 --speed 1.5 --theme dracula "$1" "${name}.gif" 
  # rm "$1"
}

function gifasciinema-no-dimensions() {
  name=$(echo "$1" | rev | cut -d '.' -f 2- | rev)
  agg --font-size 26 --speed 1.5 --theme dracula "$1" "${name}.gif" 
  # rm "$1"
}

function webm2gif() {
    ffmpeg -y -i "$1" -vf palettegen _tmp_palette.png
    ffmpeg -y -i "$1" -i _tmp_palette.png -filter_complex paletteuse -r 10  "${1%.webm}.gif"
    rm _tmp_palette.png
}

function count-of-tmsu-tags-by-artist() {
  for item in $(tmsu values -1 artist); do 
    echo "$item"; 
    tmsu files artist="$item" -c; 
  done \
      | xargs -n 2 \
      | sed "s| |,|" \
      | sort -nrt, -k2
}

function gitroutine() {
  git add . && git commit -m "$1" && git push && git status
}

function machineSync() {
  #description: on arch system(s), compare explicitely installed
  #packages between curr machine and some remote - can ask for
  #natively installed packages (pacman) or "foreign" (aur)
  #
  #NOTE that, on local end, this construct:
  #{THIS_COMMAND} | cut -f {N} | xargs -n 1
  #will allow for splitting field on default TAB
  #and will then remove all empty lines, providing clean
  #output that shows either the unique packages on 'remote' or 'local',
  #depending on 'N' (1 or 2). this construct is left out so user can
  #first *compare* the two columns of output, then narrow down to one if desired,
  #perhaps to then send off to xargs and install all applicable packages with pacman
  #
  #arg1 - machine[port]
  #arg2 - native or foreign packages: 'n' or 'm', respectively
  
  local_packages="local_packages.txt"
  remote_packages="remote_packages.txt"
  user_and_hostname="$1"

  #unsafe - TODO: replace this with a safe alternative
  #current usage is because non-EVAL wasn't expanding the ssh command properly
  #and was having issue with hostname
  remote_command="ssh ${user_and_hostname} \"pacman -Qe${2}\" | cut -d ' ' -f 1 | sort -u"

  pacman -Qe"${2}" | cut -d ' ' -f 1 | sort -u > $local_packages
  eval "$remote_command" > $remote_packages

  comm_result=$(comm -3 $remote_packages $local_packages)

  if [[ ! -z "$3" && "$3" == "install" ]]; then
    echo "$comm_result" | cut -f 1 | xargs -n 1 sudo pacman -S
  else
    echo "$comm_result"
  fi

}
