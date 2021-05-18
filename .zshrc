
### SOURCE GUARD ###
[[ $- != *i* ]] && return

### PATH ###
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
### END PATH ###

### EXPORTS ###
export TERM="xterm-256color"                      # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|doas reboot|history|cd -|cd ..)"
### END EXPORTS ###

### VI MODE ###
bindkey -v
### END VI MODE ###

### INCLUDE FILES ###
for zsh in $(ls -a --color=never ${HOME}/.config/zsh/**/*.zsh); do
	. "${zsh}"
done
### END INCLUDE FILES ###

### SET MANPAGER ###
# "vim" as manpager
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"
### END SET MANPAGER ###

### ZSH FEATURES ###
# Extend globbing
setopt extendedGlob

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Ignore duplicate in history
setopt hist_ignore_dups

# Nobody need flow control anymore. Troublesome feature.
setopt noflowcontrol


### END ZSH FEATURES ###



## Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
#unsetopt extendedglob
## End of lines configured by zsh-newuser-install
## The following lines were added by compinstall
#zstyle :compinstall filename '/home/jonas/.zshrc'
#
autoload -Uz promptinit
promptinit

# Set the default prompt theme
#prompt walters
## End of lines added by compinstall

### SET THEME ###
# Add path do custom theme directory
fpath=("$HOME/.config/zsh/prompts" "$fpath[@]")
### END SET THEME ###
