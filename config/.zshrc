eval "$(starship init zsh)"export PATH="/opt/homebrew/bin:$PATH"
plugins=(git)
# BEGIN ANSIBLE MANAGED BLOCK for direnv
# direnv setup
eval "$(direnv hook zsh)"
# END ANSIBLE MANAGED BLOCK for direnv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Create TMUX_CONF environment variable
export TMUX_CONF=~/.config/tmux/tmux.conf

# fzf initializer
source <(fzf --zsh)


# Autocomplete
#
autoload -U compinit && compinit in

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dchoi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dchoi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dchoi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dchoi/google-cloud-sdk/completion.zsh.inc'; fi
