#!/bin/bash

if [ -z $FORMAT_SOURCED ]; then
	source ./3.include/2-format-output.sh
fi

if query "[1] Display System Info?"; then
	./4.modules/1-system-info.sh
fi

if query "[2] Update and Upgrade?"; then
	./4.modules/2-update-upgrade.sh
fi

if query "[3] Install common utils?"; then
	./4.modules/3-common-utils.sh
fi

if query "[4] Auto remove?"; then
	./4.modules/4-auto-remove.sh
fi

if query "[5] Install themes & icons?"; then
	./4.modules/5-themes-icons.sh
fi

if query "[6] Install zsh?"; then
	./4.modules/6-zsh.sh
fi


