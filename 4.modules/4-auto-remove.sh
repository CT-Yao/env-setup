#!/bin/bash

#================================================
# 4-auto-remove.sh
# 
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 19:47:13 
#
# This script auto removes some softwares. 
#================================================

# Source system vars and format output script.
if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
	source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
	source ./3.include/2-format-output.sh
fi

# Auto remove some softwares.
ubuntu_auto_remove() {
	sudo apt-get remove totem rhythmbox simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-sudoku -y
}


# Remove libreoffice.
uninstall_libreoffice() {
	sudo apt-get remove --purge libreoffice* -y
	sudo apt-get clean -y
	sudo apt-get autoremove -y
}


# Remove firefox.
uninstall_firefox() {
	sudo apt-get remove --purge firefox firefox-locale-en firefox-locale-zh-hans -y
}


case $os in
	Linux*)
		confirm ubuntu_auto_remove "Remove useless app?"
		confirm uninstall_libreoffice "Remove libreoffice?"
		confirm uninstall_firefox "Remove firefox?"
		;;
	*)
		echo "OS $os is not supported"
esac
