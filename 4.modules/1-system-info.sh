#!/bin/bash
# This script displays system info.

if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
	source include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
	source include/2-format-output.sh
fi

################     Display System Info     ################
system_info() {
	status "(*) System Info:"
	echo "    - User: $USER"
	echo "    - Hostname: $HOSTNAME"
	if [[ ! -z $DISTRIB_DESRIPTION ]]; then
		echo "    - OS: $DISTRIB_DESRIPTION - $DISTRIB_CODENAME"
	else
		echo "    - OS: $os"
	fi
	echo "    - Arcitecture: $os_architecture"
	echo "    - Kernel: $os_kernel"
}

system_info
