#!/bin/bash

#================================================
# 1-system-info.sh
#
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 19:38:55 
#
# This script show system info like OS, kernel.
#================================================

# Source system vars and format output script.
if [ -z $SYSTEM_VARIABLES_SOURCED ]; then
    source ./3.include/1-system-variables.sh
fi

if [ -z $FORMAT_SOURCED ];then
    source ./3.include/2-format-output.sh
fi

# Show system info.
system_info() {
    status "(*) System Info:"
    echo "  - User: $USER"
    echo "  - Hostname: $HOSTNAME"
    if [[ ! -z $DISTRIB_DESRIPTION ]]; then
    	echo "  - OS: $DISTRIB_DESRIPTION - $DISTRIB_CODENAME"
    else
    	echo "  - OS: $os"
    fi
    echo "  - Arcitecture: $os_architecture"
    echo "  - Kernel: $os_kernel"
}

system_info
