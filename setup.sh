#!/bin/bash

if [ -z $FORMAT_SOURCED ]; then
	source ./include/2-format-output.sh
fi

if query "[1] Display System Info?"; then
	./modules/1-system-info.sh
fi

if query "[2] Update and Upgrade?"; then
	./modules/2-update-upgrade.sh
fi

if query "[3] Install common utils?"; then
	./modules/3-common-utils.sh
fi

if query "[4] Auto remove?"; then
	./modules/4-auto-remove.sh
fi

if query "[5] Install themes & icons?"; then
	./modules/5-themes-icons.sh
fi

if query "[6] Install zsh?"; then
	./modules/6-zsh.sh
fi


