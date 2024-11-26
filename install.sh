#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles/config"

FILES=(".gitconfig", ".zshrc")
CONFIG_DIRS=("./config/nvim", "./config/tmux")

echo "Installing Dotfiles and Configs"

for file in "${FILES[@]}"; do 

  target = "$HOME/$file"

  # Create back up if exists
  if [ -e "$target"]; then 
    echo "Backing up $target to $target.bak"
    mv "$target" "$target.bak"
  fi

  # Create Symlink 
  echo "Creating symlink for $file"
  ln -s "$DOTFILES_DIR" "$target"
done


# Loop through and create symlinks for directories
for dir in "${CONFIG_DIRS[@]}"; do
  target="$HOME/$dir"
  
  # Backup existing directory if it exists
  if [ -d "$target" ]; then
    echo "Backing up $target to $target.bak"
    mv "$target" "$target.bak"
  fi
  
  # Create the symlink for the directory
  echo "Creating symlink for directory $dir"
  ln -s "$DOTFILES_DIR/$dir" "$target"
done

echo "Dotfiles installed!"
