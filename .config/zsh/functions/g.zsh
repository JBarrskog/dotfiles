g() {
if [[ $# > 0 ]]; then
    # if there are arguments, send them to git
    git $@
else
    # otherwise, run git status
    git s
fi
}
