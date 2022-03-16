#!/bin/env bash

wd=$(pwd)

# .gitconfig
ln -sf $wd/.gitconfig ~/.gitconfig

# alacritty
ln -sf $wd/alacritty ~/.config/

# mako
ln -sf $wd/mako ~/.config/

# hikari: WM
ln -sf $wd/hikari ~/.config/

# neovim
ln -sf $wd/nvim ~/.config/

# zsh
ln -sf $wd/ZSH/.zshrc ~/ # zshrc
ln -sf $wd/Scripts ~/Documents/Code/Scripts # Scripts
ln -sf $wd/starship/starship.toml ~/.config/ # Starship port
# zsh-autosuggestions
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# zathura
ln -sf $wd/zathura ~/.config

# Leftwm
ln -sf $wd/leftwm ~/.config
