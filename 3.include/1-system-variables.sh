#!/bin/bash

SYSTEM_VARIABLES_SOURCED=1

################      LSB release Info       ################

# $DISTRIB_ID/$DISTRIB_RELEASE/$DISTRIB_CODENAME/$DISTRIB_DESCRIPTION
if [ -f /etc/lsb-release ]; then
	. /etc/lsb-release
fi

################  System Architecture Info   ################
os_architecture=$(uname -m)
os_kernel=$(uname -r)
os=$(uname -s)
