dotfiles::is_git() {
    if [[ ${PWD##$HOME/.config} != $PWD ]] ; then
        [[ $(command git --git-dir=$DOTFILES --work-tree=$HOME rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
    else
        [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
    fi
}
