# Dotfiles

This repository contains my personal dotfiles configuration.

## Installation

1. Clone this repository to `~/.config/dotfiles`:
   ```bash
   git clone <repository-url> ~/.config/dotfiles
   ```

2. Symlink the dotfiles folder to the parent directory using GNU `stow`:
   ```bash
   # Install stow if you don't have it
   brew install stow
   
   # Navigate to the dotfiles directory
   cd ~/.config/dotfiles
   
   # Symlink to parent directory
   stow -t .. .
   ```

This will create symlinks from `~/.config/dotfiles` to `~/.config/` for all files and directories in this repository.