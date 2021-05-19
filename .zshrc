### SOURCE GUARD ###
[[ $- != *i* ]] && return

export ZSH=$HOME/.config/zsh

#if [ -z "$TMUX" ]; then
#    export TERM=xterm-256color-italic
#else
    export TERM=tmux-256color
#fi

### INCLUDE FILES ###
for zsh in $(ls -a --color=never ${HOME}/.config/zsh/**/*.zsh | grep -v "/plugins/"); do
	. "${zsh}"
done

# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

# Correct some error
zle -N history-beginning-search-backwar

# Add to path
prepend_path $HOME/bin
prepend_path $ZSH/bin

# define the code directory
# This is where my code exists and where I want the `c` autocomplete to work from exclusively
if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi

# display how long all tasks over 10 seconds take
export REPORTTIME=10
export KEYTIMEOUT=1              # 10ms delay for key sequences

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# default to file completion
zstyle ':completion:*' completer _expand _complete _files _correct _approximate

zstyle ':completion:*' menu yes select
#zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

typeset -aU path

### PLUGIN SETUP ###
export ZPLUGDIR="$HOME/.config/zsh/plugins"

# array containing plugin information (managed by zfetch)
typeset -A plugins

zfetch mafredri/zsh-async async.plugin.zsh
zfetch zsh-users/zsh-syntax-highlighting
zfetch zsh-users/zsh-autosuggestions
zfetch chriskempson/base16-shell
zfetch Aloxaf/fzf-tab

[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo

### END PLUGIN SETUP ###

### SET MANPAGER ###
# "vim" as manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# "nvim" as manpager
export MANPAGER="nvim -c 'set ft=man' -"
#### END SET MANPAGER ###

# Select theme
fpath=("$HOME/.config/zsh/prompts" "$HOME/.config/zsh/functions" "$fpath[@]")
autoload -Uz promptinit
promptinit

prompt nicknisi
