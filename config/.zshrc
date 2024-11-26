eval "$(starship init zsh)"export PATH="/opt/homebrew/bin:$PATH"
plugins=(git)
# BEGIN ANSIBLE MANAGED BLOCK for direnv
# direnv setup
eval "$(direnv hook zsh)"
# END ANSIBLE MANAGED BLOCK for direnv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# fzf initializer
source <(fzf --zsh)
