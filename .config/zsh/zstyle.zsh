zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'		# autocomplete of '../'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'						# Matches case insensitive for lowercase
zstyle ':completion:*' insert-tab pending							# Pasting with tabs doesn't perform completion
zstyle ':completion:*' completer _expand _complete _files _correct _approximate			# Default to file completion

# Verbose completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''#

