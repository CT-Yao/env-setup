#!/bin/bash
# This script replaces ubuntu source & upgrade software

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
	source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
	source ./3.include/2-format-output.sh
fi

ubuntu_auto_remove() {
	sudo apt-get remove totem rhythmbox simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-sudoku -y
}

uninstall_libreoffice() {
	sudo apt-get remove --purge libreoffice* -y
	sudo apt-get clean -y
	sudo apt-get autoremove -y
}

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
