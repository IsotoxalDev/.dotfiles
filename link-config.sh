#!/bin/env bash

wd="$(pwd)/$(dirname $0)"

# .gitconfig
ln -sf $wd/.gitconfig ~/.gitconfig

# copy scripts
ln -sf $wd/scripts ~/Documents/Code/

# alacritty
ln -sf $wd/alacritty ~/.config/

# mako
ln -sf $wd/mako ~/.config/

# hikari: WM
ln -sf $wd/hikari ~/.config/

# waybar
ln -sf $wd/waybar ~/.config/

# neovim
ln -sf $wd/nvim ~/.config/

# helix
ln -sf $wd/helix ~/.config/

# zsh
ln -sf $wd/zsh/.zshrc ~/ # zshrc
ln -sf $wd/starship/starship.toml ~/.config/ # Starship port
# zsh-autosuggestions
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# zathura
ln -sf $wd/zathura ~/.config

# Leftwm
ln -sf $wd/leftwm ~/.config

# rofi
ln -sf $wd/rofi ~/.config
