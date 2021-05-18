over_ssh() {
    if [ -n "${SSH_CLIENT}" ]; then
        return 0
    else
        return 1
    fi
}
