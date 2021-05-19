### Aliases

# Root previleges
alias doas="doas --"

# Navigation
alias ..=' cd ..'
alias ...=' cd ../..'
alias .3=' cd ../../..'
alias .4=' cd ../../../..'
alias .5=' cd ../../../../..'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Changing "ls" to "exa"
alias ls=' exa --header --color=always --group-directories-first --git'
alias la=' ls -al'  # all files and dirs
alias ll=' ls -l'  # long format
alias lt=' ls -aT' # tree listing
alias l.=' ls -a | egrep "^\."'				    # list all files beginning with "."

# Other stuff
alias df=' df -h'

# Config for bare-repo with dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
#alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# use nvim, but don't make me think about it
[[ -n "$(command -v nvim)" ]] && alias vim="nvim"
alias v='vim'
