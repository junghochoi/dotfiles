echo "Removing Files"
sudo rm -rf ~/.zshrc
sudo rm -rf ~/.gitconfig
sudo rm -rf ~/.config/starship.toml

sudo rm -rf ~/.config/nvim
sudo rm -rf ~/.config/tmux
sudo rm -rf ~/.config/skhd
sudo rm -rf ~/.config/yabai

echo "Creating symlinks"
ln -s ~/github/dotfiles/config/.gitconfig  		~/.gitconfig
ln -s ~/github/dotfiles/config/.zshrc 		    ~/.zshrc
ln -s ~/github/dotfiles/config/starship.toml  ~/.config/starship.toml

ln -s ~/github/dotfiles/config/nvim	  ~/.config/nvim
ln -s ~/github/dotfiles/config/tmux 	  ~/.config/tmux


# Archived Configurations. To enable, move config files from ./archive_config to ./config/
# ln -s ~/github/dotfiles/config/skhd           ~/.config/skhd
# ln -s ~/github/dotfiles/config/yabai   ~/.config/yabai

echo "Creating TMUX_CONF env variable"
export TMUX_CONF=~/.config/tmux/tmux.conf

echo "Done"
