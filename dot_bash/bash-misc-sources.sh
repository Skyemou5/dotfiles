dirs=\
(~/.local/share/bash-sources/completions \
~/.local/share/bash-sources/misc-sources)

for dir in ${dirs[@]}; do
    source $(echo "${dir}/*" | envsubst)
done
