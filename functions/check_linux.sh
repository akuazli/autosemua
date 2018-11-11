#---------------------------------------------------------------------
# Function: CheckLinux
#    Check Installed Linux Version
#---------------------------------------------------------------------

CheckLinux() {
	. /etc/os-release

	# Set DISTRO variable to null
	DISTRO=''

	# Debian 7 Wheezy
	if echo $ID-$VERSION_ID | grep -iq "debian-7"; then
		DISTRO=debian7
	fi

	# Debian 8 Jessie
	if echo $ID-$VERSION_ID | grep -iq "debian-8"; then
		DISTRO=debian8
	fi

	# Debian 9 Stretch
	if echo $ID-$VERSION_ID | grep -iq "debian-9"; then
		DISTRO=debian9
	fi
}