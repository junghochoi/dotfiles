#!/bin/bash

# ----------------------------
# Helper Function to Install Packages
# ----------------------------

install_package() {
  local package=$1
  shift
  local flags=("$@")

  echo "Installing $package ${flags[*]}..."
  if command -v brew &> /dev/null; then
    brew install "${flags[@]}" "$package"
  elif command -v apt &> /dev/null; then
    sudo apt install -y "${flags[@]}" "$package"
  elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm "${flags[@]}" "$package"
  else
    echo "Unsupported package manager. Please install $package manually."
  fi
}

# ----------------------------
# TOOL INSTALLATIONS
# ----------------------------

# Install Homebrew if not installed (macOS)
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found, installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# System dependencies
echo "Installing system dependencies..."
install_package "tmux"
install_package "zsh"
install_package "fzf"
install_package "git"
install_package "python3"
install_package "node"
install_package "kubectl"
install_package "terraform"
install_package "awscli"
install_package "google-cloud-sdk"
install_package "pyenv"
install_package "nvm"
install_package "kitty" "--cask"

# ----------------------------
# Install Zsh plugins and tools
# ----------------------------

echo "Installing Zsh plugins..."
# (Plugin manager setup here if needed)

# ----------------------------
# Install TPM for Tmux
# ----------------------------

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM (Tmux Plugin Manager)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed."
fi

# ----------------------------
# Installing NVM, PyEnv and Other Managers
# ----------------------------

echo "Installing NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo "Installing PyEnv (Python Version Manager)..."
curl https://pyenv.run | bash

# ----------------------------
# Final Steps
# ----------------------------

echo "All tools have been installed successfully!"
