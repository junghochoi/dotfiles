# ----------------------------
# ⚙️ Shell Initialization
# ----------------------------

# Starship prompt
eval "$(starship init zsh)"

# Set PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Users/dchoi/bin"

# Zsh plugins
plugins=(git)

# ----------------------------
# 📁 direnv
# ----------------------------

# BEGIN ANSIBLE MANAGED BLOCK for direnv
eval "$(direnv hook zsh)"
# END ANSIBLE MANAGED BLOCK for direnv

# ----------------------------
# 🔧 NVM (Node Version Manager)
# ----------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ----------------------------
# 🧩 TMUX Configuration
# ----------------------------

export TMUX_CONF="$HOME/.config/tmux/tmux.conf"

# ----------------------------
# 🔍 FZF (Fuzzy Finder)
# ----------------------------

source <(fzf --zsh)

# ----------------------------
# 🐳 Docker Completions
# ----------------------------

FPATH="$HOME/.docker/completions:$FPATH"
autoload -Uz compinit
compinit

# ----------------------------
# 🛠️ Aliases
# ----------------------------

alias tf=terraform

# ----------------------------
# ☁️ Google Cloud SDK
# ----------------------------

if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

