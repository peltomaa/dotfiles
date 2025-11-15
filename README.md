# Dotfiles

This repository contains my personal dotfiles configuration.

## Installation

1. Clone this repository to `~/dotfiles`:
   ```bash
   git clone <repository-url> ~/dotfiles
   ```

2. Symlink the dotfiles folder to the parent directory using GNU `stow`:
   ```bash
   # Install stow if you don't have it
   brew install stow
   
   # Navigate to the dotfiles directory
   cd ~/dotfiles
   
   # Symlink to parent directory
   stow -t .. .
   ```

This will create symlinks from `~/dotfiles` to `~/` for all files and directories in this repository.
