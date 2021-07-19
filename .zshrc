
### SOURCE GUARD ###
[[ $- != *i* ]] && return

export ZSH=$HOME/.config/zsh
export CONFIG=$HOME/.config
export DOTFILES=$HOME/dotfiles

export LC_CTYPE="sv_SE.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"

### TYPESET ###
typeset -aU path
typeset -A plugins

### END TYPESET ###
### PATH ###
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/go/bin" ] ;
  then PATH="$HOME/go/bin:$PATH"
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
for zsh in $(/bin/ls -a ${HOME}/.config/zsh/**/*.zsh | grep -v "/plugins/"); do
	. "${zsh}"
done
### END INCLUDE FILES ###

### SET MANPAGER ###
# "vim" as manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# "nvim" as manpager
export MANPAGER="nvim -c 'set ft=man' -"
### END SET MANPAGER ###

# Initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

### SET THEME ###
# Add path do custom theme directory
fpath=("$CONFIG/zsh/prompts" "$CONFIG/zsh/functions" "$fpath[@]")
autoload -Uz promptinit
promptinit
prompt mytheme01
#source $ZSH/prompts/prompt_test1_setup
### END SET THEME ###
