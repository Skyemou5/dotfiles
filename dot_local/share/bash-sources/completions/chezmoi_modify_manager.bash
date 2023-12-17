_bpaf_dynamic_completion()
{
    source <( "$1" --bpaf-complete-rev=8 "${COMP_WORDS[@]:1}" )
}
complete -o nosort -F _bpaf_dynamic_completion chezmoi_modify_manager
