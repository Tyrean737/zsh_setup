#!/bin/bash

# Make sure script is not run as root
if [[ "$EUID" -eq 0 ]]; then
  echo "This script must NOT be run as root." >&2
  exit 1
fi

# Get user name
USER=$(whoami)

# Install packages
sudo pacman -S zsh zsh-completions fzf awesome-terminal-fonts powerline-fonts powerline ttf-hack-nerd
trizen -S --noedit oh-my-zsh-git zsh-theme-powerlevel10k

# Copy config
mkdir /home/$USER/.config/zsh-config/
cp config.zsh /home/$USER/.config/zsh-config/

# Copy plugins to zsh directory
sudo cp -r plugins/ /usr/share/zsh/

# Set up .zshrc
echo "source /home/$USER/.config/zsh-config/config.zsh" >> /home/$USER/.zshrc
