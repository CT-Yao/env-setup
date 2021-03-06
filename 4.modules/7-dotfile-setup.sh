#!/bin/bash

#================================================
# 7-dotfile-setup.sh
# 
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 20:39:57
#
# This script installs themes and icons.
#================================================

# Source system vars and format output script.
if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
    source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
    source ./3.include/2-format-output.sh
fi


# Neovim Configuration.
set_neovim() {
    if [[ -d ~/.config/nvim ]]; then
        cp -rf ./2.dotfiles/nvim ~/.config/
    else
        cp -r ./2.dotfiles/nvim ~/.config/
    fi
}


# Zsh Configuration
set_zsh() {
    if [[ ! -d ./backup ]]; then
        mkdir backup
    fi
    
    if [[ -e ~/.zshrc ]]; then
       cp -f ~/.zshrc ./backup
    fi
    
    cp -f ./2.dotfiles/.zshrc ~/.zshrc
}

case $os in
    Linux*)
        confirm set_neovim "Set Neovim Configuration?"
        confirm set_zsh "Set zsh Configuration?"
        ;;
    *)
        echo "OS $os is not supported"
esac

