#!/bin/bash
# This script replaces ubuntu source & upgrade software

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
	source include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
	source include/2-format-output.sh
fi

install_deepin_wine() {
	git clone "https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git"
	cd deepin-wine
	sudo ./install.sh
}

install_deepin_wechat(){
	sudo wget "https://mirrors.huaweicloud.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.2.31deepin0_i386.deb" 
	sudo dpkg -i *wechat*deb
	sudo apt install libjpeg62:i386
	sudo rm -rf *wechat*deb
}

install_deepin_tim(){
	sudo wget https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_2.0.0deepin4_i386.deb
	sudo dpkg -i *qq.office*deb
	sudo rm -rf *qq.office*deb
}

case $os in
	Linux*)
		confirm install_deepin_wine "Install deep-wine?"
		confirm install_deepin_wechat "Install deep-wine-wechat?"
		confirm install_deepin_tim "Install deep-wine-Tim?"
		;;
	*)
		echo "OS $os is not supported"
esac
