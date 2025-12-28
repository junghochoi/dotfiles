#!/bin/bash

# ----------------------------
# HELPER Functions
# ----------------------------

echo_color() {
  local color=$1
  local message=$2

  case "$color" in
    red)    code="\033[0;31m" ;;
    green)  code="\033[0;32m" ;;
    yellow) code="\033[0;33m" ;;
    blue)   code="\033[0;34m" ;;
    magenta) code="\033[0;35m" ;;
    cyan)   code="\033[0;36m" ;;
    bold)   code="\033[1m" ;;
    *)      code="\033[0m" ;; # default (no color)
  esac

  printf "${code}%s\033[0m\n" "$message"
}

link_config() {
  local source=$1
  local target=$2
  local name=$3

  echo_color "blue" "Setting up config - $name"

  if [ -L "$target" ] || [ -d "$target" ]; then
    echo "Removing $target"
    rm -rf "$target"
  fi

  echo "Linking $target → $source"
  ln -s "$source" "$target"
}

# ----------------------------
# MAIN: Install Script
# ----------------------------

# Ensure we're in the correct directory
if [[ "$(pwd)" != "$HOME/dotfiles"* ]]; then
    echo "Error: Script must be run from within ~/dotfiles"
    exit 1
fi

echo "Linking dotfiles..."

# Linking config files
link_config "$HOME/dotfiles/config/.gitconfig"    "$HOME/.gitconfig"              "git"
link_config "$HOME/dotfiles/config/.zshrc"        "$HOME/.zshrc"                  "zsh"
link_config "$HOME/dotfiles/config/starship.toml" "$HOME/.config/starship.toml"   "starship"
link_config "$HOME/dotfiles/config/nvim"          "$HOME/.config/nvim"            "nvim"
link_config "$HOME/dotfiles/config/tmux"          "$HOME/.config/tmux"            "tmux"
link_config "$HOME/dotfiles/config/kitty"         "$HOME/.config/kitty"           "kitty"

# Run bootstrap.sh for tool installations
# echo_color "green" "Running bootstrap.sh to install required tools..."
# chmod +x bootstrap.sh
# ./bootstrap.sh

echo_color "green" "Setup complete!"
