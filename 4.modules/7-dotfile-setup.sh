#!/bin/bash

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
    source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
    source ./3.include/2-format-output.sh
fi

set_neovim() {
    if [[ -d ~/.config/nvim ]]; then
        cp -rf ./5.dotfiles/nvim ~/.config/
    else
        cp -r ./5.dotfiles/nvim ~/.config/
    fi
}


case $os in
    Linux*)
        confirm set_neovim "Set Neovim Configuration?"
        ;;
    *)
        echo "OS $os is not supported"
esac

