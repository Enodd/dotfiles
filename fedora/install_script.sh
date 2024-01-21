#!/bin/bash

# installing the most important packages

# defining log file
log_file=$HOME/install_log.txt

# ======================================
check_if_installed() {
	echo "\n=========$1=========\n"
	if type -p "$1" > /dev/null; then
		echo "$1 Installed" >> $log_file
	else
		echo "$1 FAILED TO INSTALL" >> $log_file
	fi
}

sudo dnf update 

sudo dnf install zsh
check_if_installed zsh
sudo dnf install neovim
check_if_installed nvim
sudo dnf install nodejs
check_if_installed node
sudo dnf install rust cargo
check_if_installed rust
check_if_installed cargo

cat $log_file
rm $log_file
