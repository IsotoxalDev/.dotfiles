#!/bin/env bash

wd=$(pwd)

# .gitconfig
ln -sf $wd/.gitconfig ~/.gitconfig

# alacritty
ln -sf $wd/.config/alacritty ~/.config/

# mako
ln -sf $wd/.config/mako ~/.config/

# hikari: WM
ln -sf $wd/.config/hikari ~/.config/

# neovim
ln -sf $wd/.config/nvim ~/.config/
