sudo rm -rf ~/.zshrc
sudo rm -rf ~/.gitconfig
sudo rm -rf ~/.config/starship.toml

sudo rm -rf ~/.config/nvim
sudo rm -rf ~/.config/tmux


ln -sf ~/dotfiles/config/.gitconfig  		~/.gitconfig
ln -sf ~/dotfiles/config/.zshrc 		    ~/.zshrc
ln -sf ~/dotfiles/config/starship.toml  ~/.config/starship.toml

ln -sf ~/dotfiles/config/nvim	  ~/.config/nvim
ln -sf ~/dotfiles/config/tmux 	~/.config/tmux
