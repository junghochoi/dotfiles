# HELPER Functions


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

# MAIN
if [[ "$(pwd)" != "$HOME/dotfiles"* ]]; then
    echo "Error: Script must be run from within ~/dotfiles"
      exit 1
fi

echo "Linking dotfiles..."


link_config "$HOME/dotfiles/config/.gitconfig"    "$HOME/.gitconfig"              "git"
link_config "$HOME/dotfiles/config/.zshrc"        "$HOME/.zshrc"                  "zsh"
link_config "$HOME/dotfiles/config/starship.toml" "$HOME/.config/starship.toml"   "starship"
link_config "$HOME/dotfiles/config/nvim"          "$HOME/.config/nvim"            "nvim"
link_config "$HOME/dotfiles/config/tmux"          "$HOME/.config/tmux"            "tmux"



# Archived Configurations. To enable, move config files from ./archive_config to ./config/
# ln -s ~/dotfiles/config/skhd           ~/.config/skhd
# ln -s ~/dotfiles/config/yabai   ~/.config/yabai
