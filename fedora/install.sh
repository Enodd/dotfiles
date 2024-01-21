#!/bin/bash

dotfiles_dir=$HOME/dotfiles
log_file=$HOME/install_log.txt

sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1

ln -sf $dotfiles_dir/zsh/.zshrc ~/.zshrc
ln -sf $dotfiles_dir/config ~/.config

sudo chmod +x install_script.sh
exec ./install_script.sh

echo -e "\n======SUMMARY\n"
cat $log_file
rm $log_file
