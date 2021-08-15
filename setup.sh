#!/bin/bash

#================================================
# setup.sh
#
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 19:06:12
# 
# System initial configuration shell script. 
# Execute command 'sudo chmod u+x setup.sh' 
# and 'sudo ./setup.sh' to initialize system.
#================================================

# Source format output file.
if [ -z $FORMAT_SOURCED ]; then
    source ./3.include/2-format-output.sh
fi

# Ask permission for scripts 
sudo chmod u+x ./3.include/*
sudo chmod u+x ./4.modules/*

# Querying whether show system info.
if query "[1] Display System Info?"; then
    ./4.modules/1-system-info.sh
fi

# Querying whether update.
if query "[2] Update and Upgrade?"; then
    ./4.modules/2-update-upgrade.sh
fi

# Querying whethe install common utils.
if query "[3] Install common utils?"; then
    ./4.modules/3-common-utils.sh
fi

# Querying whether auto remove useless software.
if query "[4] Auto remove?"; then
    ./4.modules/4-auto-remove.sh
fi

# Querying whether install themes and icons.
if query "[5] Install themes & icons?"; then
    ./4.modules/5-themes-icons.sh
fi

# Querying whether replace bash with zsh.
if query "[6] Install zsh?"; then
    ./4.modules/6-zsh.sh
fi

# Querying whether config dotfiles.
if query "[7] Dotfile Setup?"; then
    ./4.modules/7-dotfile-setup.sh
fi

