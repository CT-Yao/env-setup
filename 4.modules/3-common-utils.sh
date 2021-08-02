#!/bin/bash
# This script replaces ubuntu source & upgrade software

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
	source include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
	source include/2-format-output.sh
fi

config=$(cat ./config/1-download-link.json | sed ':a;N;s/[\t\n\ \r]//g;ta')

install_python_pkgs() {
	sudo apt-get install -yq python3-dev python3-pip libudev-dev
	sudo python3 -m pip install -U pip
}

install_common_utils() {
	sudo apt-get install -yq --allow-unauthenticated \
		vim git cmake g++ axel curl wget neovim
}

install_useful_utils() {
	sudo apt-get install -yq --allow-unauthenticated \
		okular inkscape gimp
}

install_typora() {
	wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
	sudo add-apt-repository 'deb https://typora.io/linux ./'
	sudo apt-get update 
	sudo apt-get install typora
}

install_wps_office() {
	link=$(extract_json "$config" "wps-office" "")
	if [ -z $link ]; then
		error "Please add vscode wps-office to config file!"
	fi
	
	sudo wget -O wps-office.deb $(echo $link | sed -e 's/\"//g')
	sudo dpkg -i wps-office.deb
	sudo rm -rf ~/.config/Kingsoft
	sudo rm -rf wps-office.deb
	
	sudo unzip ./assets/wps-fonts.zip -d /usr/share/fonts/wps-office
}


install_chrome() {
	link=$(extract_json "$config" "chrome" "")
	if [ -z $link ]; then
		error "Please add vscode chrom to config file!"
	fi
	
	sudo wget -O chrome.deb $(echo $link | sed -e 's/\"//g')
	sudo dpkg -i chrome.deb
	sudo rm -rf chrome.deb
}

install_vscode() {
	link=$(extract_json "$config" "vscode" "")
	if [ -z $link ]; then
		error "Please add vscode link to config file!"
	fi
	
	sudo wget -O vscode.deb $(echo $link | sed -e 's/\"//g')
	sudo dpkg -i vscode.deb
	sudo rm -rf vscode.deb
}

install_jetbrains_toolbox() {
	link=$(extract_json "$config" "jetbrains-toolbox" "")
	if [ -z $link ]; then
		error "Please add jetbrains-toolbox link to config file!"
	fi
	
	sudo wget -O jetbrains-toolbox.tar.gz $(echo $link | sed -e 's/\"//g')
	sudo tar -xzvf jetbrains-toolbox.tar.gz
	cd jetbrains-toolbox*/ && sudo ./jetbrains-toolbox
	cd .. && sudo rm -rf jetbrains-toolbox*
}

install_sogou_input() {
	# sogou link will update after a while, so we can't install use hsitory link.
	# link=$(extract_json "$config" "sogou-input" "")
	# if [ -z $link ]; then
	#	error "Please add sogou-input link to config file!"
	# fi
	
	# sudo wget -O sogou-input.deb $(echo $link | sed -e 's/\"//g')
	sudo dpkg -i ./assets/sogou-input.deb
	sudo apt -f install
	# sudo rm -rf sogou-input.deb
}

install_netease_music() {
	link=$(extract_json "$config" "netease-music" "")
	if [ -z $link ]; then
		error "Please add netease-music link to config file!"
	fi
	
	sudo wget -O netease-music.deb $(echo $link | sed -e 's/\"//g')
	sudo dpkg -i netease-music.deb
	sudo rm -rf netease-music.deb
}

case $os in
Linux*)
	confirm install_python_pkgs "Install python pip?"
	confirm install_common_utils "Install common utils?"
	confirm	install_useful_utils "Install pdf-viewer & gimp?"
	confirm install_chrome "Install Chrome?"
	confirm install_typora "Install Typora?"
	confirm install_wps_office "Install WPS office?"
	confirm install_vscode "Install VS code?"
	confirm install_jetbrains_toolbox "Install Jetbrains toolbox"
	confirm install_sogou_input "Install Sogou input?"
	confirm install_netease_music "Install Netease music?"
	;;
*)
	error "OS $os is not supported"
esac

