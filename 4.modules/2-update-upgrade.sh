#!/bin/bash
# This script replaces ubuntu source & upgrade software

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
	source include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
	source include/2-format-output.sh
fi

source_list_path="/etc/apt/sources.list"

use_mirror_source() {
	status "Backup source.list"
	sudo cp "$source_list_path" /etc/apt/sources.list.bak
	sudo cp "$source_list_path" ./backup/sources.list
	
	if query "Enable all deb repo (include source)"; then
		sudo sed -i 's/#\ deb-src/deb-src/g' "$source_list_path" 
	fi
	
	if query "Replace ubuntu sources?"; then
		sudo sed -i 's/http:\/\/.*archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' "$source_list_path"
		sudo sed -i 's/http:\/\/.*security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' "$source_list_path"
	fi
	
	if query "Use https USTC mirror"; then 
		sudo apt-get install -y apt-transport-https
		sudo sed -i 's/http:\/\/mirrors.ustc.edu.cn/https:\/\/mirrors.ustc.edu.cn/g' "$source_list_path"
	fi
}

update_apt() {
	status "Update apt-key..."
	sudo apt-key update
	
	status "Clean apt packages..."
	sudo apt-get clean
	
	status "Update apt package list..."
	sudo apt-get update
	
	status "Upgrade apt packages..."
	sudo apt-get -y upgrade
	
	status "Remove apt unnecessary packages..."
	sudo apt-get -y autoremove --allow-unauthenticated
}

case $os in 
Linux*)
	confirm use_mirror_source "Replace APT and PPA repo to china mirror"
	confirm update_apt "Update package list and upgrade"
	;;
*)
	echo "OS $os is not supported"
esac
