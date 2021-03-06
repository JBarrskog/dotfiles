run_under_tmux() {
    # Run $1 under session or attach if such session already exist.
    # $2 is optional path, if no specified, will use $1 from $PATH.
    # If you need to pass extra variables, use $2 for it as in example below..
    # Example usage:
    #   torrent() { run_under_tmux 'rtorrent' '/usr/local/rtorrent-git/bin/rtorrent'; }
    #   mutt() { run_under_tmux 'mutt'; }
    #   irc() { run_under_tmux 'irssi' "TERM='screen' command irssi"; }


    # There is a bug in linux's libevent...
    # export EVENT_NOEPOLL=1

    command -v tmux >/dev/null 2>&1 || return 1

    if [ -z $1 ]; then return 1; fi
        local name=$1
    if [ -n $2 ]; then
        local execute=$2
    else
        local execute="command ${name}"
    fi

    if tmux has-session -t ${name} 2>/dev/null; then
        tmux attach -d -t ${name}
    else
        tmux new-session -s ${name} ${execute} \; set-option status \; set set-titles-string "${name} (tmux@${HOST})"
    fi
}

# Add frequently used tmux-calls here!
