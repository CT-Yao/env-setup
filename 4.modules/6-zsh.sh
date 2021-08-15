#!/bin/bash

#================================================
# 6-zsh.sh
# 
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 20:34:32 
#
# This script installs ZSH and OH-MY-ZSH.
#================================================

# Source system vars and format output script.
if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
    source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
    source ./3.include/2-format-output.sh
fi

# Install ZSH
install_zsh() {
    status $(echo $SHELL)
    sudo apt update
    sudo apt install -y zsh autojump
}


# Install OH-MY-ZSH
install_oh_my_zsh(){
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-autosuggestions
}


case $os in
    Linux*)
        confirm install_zsh "Install zsh?"
        confirm install_oh_my_zsh "Install oh-my-zsh?"
        sudo chsh -s /bin/zsh
        ;;
    *)
        echo "OS $os is not supported"
esac
