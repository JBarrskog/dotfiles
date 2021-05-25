# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Load zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Because your terminal should be able to perform tasks asynchronously without external tools!
zplug "mafredri/zsh-async", from:"github", use:"async.zsh", defer:2

# Fish-like syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", from:"github", defer:2

# Fish-like full-comand autosuggestion
zplug "zsh-users/zsh-autosuggestions", from:"github"

# Change default ANSI colors, mainly 17-21 of 256.
zplug "chriskempson/base16-shell", from:"github"

# Replace ZSH default completion menu with fzf
zplug "Aloxaf/fzf-tab", from:"github", use:"fzf-tab.plugin.zsh", as:command

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
