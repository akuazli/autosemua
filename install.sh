#!/bin/bash

##
# IntKSetup system installer
#
# Script: install.sh
# Version: 1.1.5
# Author: Doctype(ndieys) <doct.knowledge@gmail.com>
# Description: This script will install all the packages needed to install
#              IntKSetup on your server.
##

## Global variables
grey='\e[1;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
magenta='\e[0;35m'
cyan='\e[0;36m'
noclr='\e[0m'

PWD=$(pwd);

source $PWD/functions/check_linux.sh
echo "Checking your system, please wait..."
CheckLinux

source $PWD/distros/$DISTRO/preinstallcheck.sh
source $PWD/distros/$DISTRO/install_basics.sh
source $PWD/distros/$DISTRO/install_mysql.sh
source $PWD/distros/$DISTRO/install_webserver.sh
source $PWD/distros/$DISTRO/install_bind.sh
source $PWD/distros/$DISTRO/install_fail2ban.sh
source $PWD/distros/$DISTRO/install_basephp.sh

clear

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "'||'  '|' '||''|.   .|'''.|    +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+"
echo -e " '|.  .'   ||   ||  ||..  '    |K| |n| |o| |w| |l| |e| |d| |g| |e|"
echo -e "  ||  |    ||...|'   ''|||.    +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+"
echo -e "   |||     ||      .     '||   ${grey}Created by Doctype${noclr}"
echo -e "    |     .||.     |'....|'    ${grey}Powered by VPS.Knowledge${noclr}"
echo -e "Linux Debian-8.11 LTS (x86_64) ${grey}2018, All Rights Reserved.${noclr}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "This script will do a nearly unattended installation of all"
echo "needed and required software to run IntKSetup."
echo
echo

echo -n "Checking user privilage... "
if [[ "$UID" -ne 0 ]] ; then
    echo -e "[${red}ERROR${noclr}]"
    exit 1
else
    echo -e "[${green}SUCCESS${noclr}]"
fi

echo -n "Checking internet connection... "
ping -qq -c 3 www.google.com > /dev/null 2>&1
if [ ! "$?" -eq 0 ] ; then
    echo -e "[${red}ERROR${noclr}]"
    exit 1;
else
    echo -e "[${green}SUCCESS${noclr}]"
fi

if [ -n "$PRETTY_NAME" ]; then
	echo "The detected Distribution is: " $PRETTY_NAME
else
	echo "The detected Distribution is: " $ID-$VERSION_ID
fi

if [ -n "$DISTRO" ]; then
	read -p "Is this correct? [y/N]" choose
    if ! [[ "$choose" == "y" || "$choose" == "Y" ]] ; then
        exit 1
    fi
else
	echo -e "[${red}ERROR${noclr}] Sorry, your system is not supported by this script."
	exit 1
fi

PreInstallCheck
InstallBasics
InstallOpenSSH
InstallDropbear
InstallOpenVPN
InstallSquid3
InstallBadVPN
InstallStunnel4
InstallFail2ban
InstallIPTables
InstallWebmin

exit 0