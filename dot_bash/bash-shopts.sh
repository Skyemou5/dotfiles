#custom shell options
s_opts=\
(autocd \
cdable_vars \
direxpand \
expand_aliases \
extglob \
extquote \
histappend \
checkwinsize \
globstar)

for s_opt in ${s_opts[@]}; do
	shopt -s "$s_opt"
done
