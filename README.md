# Dotfiles Setup

## 📦 Installation

1. **Clone this repository** into your home directory.

2. **Install system tools** by running:
   ```bash
   ./bootstrap.sh
   ```

3. **Symlink dotfiles** into the correct locations:
   ```bash
   ./install.sh
   ```

---

## ✋ Manual Steps

- **Raycast Setup**:
  - Manually install [Raycast](https://raycast.com/).
  - To import settings:
    - Press `Command + Space` inside Raycast.
    - Search for **Import Settings and Data**.
    - Upload the configuration file found in this repository.
  
- **Updating Raycast Configurations**:
  - After making changes to your Raycast setup, manually upload/download the settings and update this repository.

---

## 🛠 Useful Commands

- **Install Tmux Plugins**:
  - Press `<Prefix> + I`  
    (Your `<Prefix>` is set to `Control + Space`)
  
- **Install Neovim LSPs**:
  - Open Neovim and run:
    ```vim
    :MasonInstallAll
    ```

---

## ✅ Summary

- `./bootstrap.sh` — Install necessary tools.
- `./install.sh` — Symlink configuration files.
- Manual — Install and configure Raycast.

---
