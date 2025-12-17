#!/bin/bash
set -e

# Make sure script is not run as root
if [[ "$EUID" -eq 0 ]]; then
  echo "This script must NOT be run as root." >&2
  exit 1
fi

# Make sure trizen is installed
if ! command -v trizen >/dev/null 2>&1; then
    echo "Error: trizen is not installed or not in PATH." >&2
    echo "Please install it first (e.g. from the AUR)." >&2
    exit 1
fi

# Get user name
USER=$(whoami)

# Install packages
echo "Installing required packages..."
sudo pacman -S zsh zsh-completions fzf awesome-terminal-fonts powerline-fonts powerline ttf-hack-nerd
trizen -S --noedit oh-my-zsh-git zsh-theme-powerlevel10k

# Copy config
echo "Copying zsh-config..."
mkdir -p /home/$USER/.config/zsh-config/
cp config.zsh /home/$USER/.config/zsh-config/

# Copy plugins to zsh directory
echo "Copying zsh plugins..."
sudo cp -r plugins/ /usr/share/zsh/

# Set up .zshrc
echo "source /home/$USER/.config/zsh-config/config.zsh" >> /home/$USER/.zshrc
