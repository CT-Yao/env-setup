#!/bin/bash

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
    source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
    source ./3.include/2-format-output.sh
fi

install_tools() {
    sudo apt install -y gnome-tweak-tool
    sudo apt install -y gnome-shell-extensions 
    sudo apt install -y chrome-gnome-shell
    sudo apt install -y gtk2-engines-murrine gtk2-engines-pixbuf 
    sudo apt install -y sassc optipng inkscape libcanberra-gtk-module libglib2.0-dev libxml2-utils
}

install_icons(){
    for file in $(ls ./0.assets/2.icons/)
    do
        sudo tar -xJf ./icons/${file} -C /usr/share/icons/
    done
    
    # papirus icons
    sudo add-apt-repository -y ppa:papirus/papirus
    sudo apt install -y papirus-folders papirus-icon-theme
    
    # paper	
    sudo add-apt-repository ppa:snwh/ppa
    sudo apt-get update
    sudo apt-get install paper-gtk-theme
    
    sudo apt-get install paper-icon-theme
}

install_themes(){
    for file in $(ls ./0.assets/3.themes/)
    do
        sudo tar -xJf ./themes/${file} -C /usr/share/themes/
    done
}

change_login_img() {
    sudo ./0.assets/0.misc/change-gdm-background ./0.assets/1.wallpapers/wallpaper.jpg
}

case $os in
    Linux*)
        confirm install_tools "Install tweak tools?"
        confirm install_icons "Install icons?"
        confirm install_themes "Install themes?"
        confirm change_login_img "Change login image?"
        ;;
    *)
        echo "OS $os is not supported"
esac
