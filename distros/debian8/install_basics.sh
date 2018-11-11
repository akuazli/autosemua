#---------------------------------------------------------------------
# Function: InstallBasics
#    Install basic packages
#---------------------------------------------------------------------
InstallBasics() {
    echo -n "Updating apt and upgrading currently installed packages... "
    apt-get -qq update > /dev/null 2>&1
    apt-get -qqy upgrade > /dev/null 2>&1
    apt-get -qqy install build-essential > /dev/null 2>&1
    echo -e "[${green}DONE${noclr}]"

    echo

    echo "Installing basic packages... "
    apt-get -y install ssh openssh-server apt-transport-https debconf-utils dnsutils binutils git lsb-release > /dev/null 2>&1
    echo -e "[${green}DONE${noclr}]"

    echo

    echo -n "Reconfigure dash... "
    echo "dash dash/sh boolean false" | debconf-set-selections
    dpkg-reconfigure -f noninteractive dash > /dev/null 2>&1
    echo -e "[${green}DONE${noclr}]"
}
