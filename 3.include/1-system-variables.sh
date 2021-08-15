#!/bin/bash

#================================================
# 1-system-variables.sh
#
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 20:42:32 
#
# This script stores system variables.
#================================================

SYSTEM_VARIABLES_SOURCED=1

# LSB release Info.       
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
fi

# System Architecture Info.
os_architecture=$(uname -m)
os_kernel=$(uname -r)
os=$(uname -s)
