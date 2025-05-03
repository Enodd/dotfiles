#!/bin/bash

echo "Setup config for archlinux for date: $(date)"

echo "Installing required packages"
sudo pacman -Syu git zsh fastfetch fakeroot make gcc tar waybar hyprland alacritty stow nvm go neovim hyprpaper hyprlock

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Cloning required repos"

# cloning my dotfiles
git clone https://github.com/enodd/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles
stow .

cd $HOME

git clone https://aur.archlinux.org/yay-git
cd yay-git
makepkg -si
