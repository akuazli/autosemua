#---------------------------------------------------------------------
# Function: PreInstallCheck
#    Do some pre-install checks
#---------------------------------------------------------------------
PreInstallCheck() {
	# set time GMT +8
	ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

	echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
	echo 1 > /proc/sys/net/ipv4/ip_forward

	echo "nameserver 8.8.8.8" > /etc/resolv.conf
	echo "nameserver 8.8.4.4" >> /etc/resolv.conf

	echo 'deb http://mirrors.digitalocean.com/debian jessie main' > /etc/apt/sources.list
	echo 'deb-src http://mirrors.digitalocean.com/debian jessie main' > /etc/apt/sources.list
	echo '' > /etc/apt/sources.list
	echo 'deb http://security.debian.org/ jessie/updates main' > /etc/apt/sources.list
	echo 'deb-src http://security.debian.org/ jessie/updates main' > /etc/apt/sources.list
	echo '' > /etc/apt/sources.list
	echo 'deb http://mirrors.digitalocean.com/debian jessie-updates main' > /etc/apt/sources.list
	echo 'deb-src http://mirrors.digitalocean.com/debian jessie-updates main' > /etc/apt/sources.list
	echo '' > /etc/apt/sources.list
	echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
	echo '' > /etc/apt/sources.list
	echo 'deb https://download.webmin.com/download/repository sarge contrib' > /etc/apt/sources.list
	echo '' > /etc/apt/sources.list
	echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list
	echo 'deb-src http://packages.dotdeb.org jessie all' > /etc/apt/sources.list

    wget "https://www.dotdeb.org/dotdeb.gpg"
    apt-key add dotdeb.gpg

    wget "http://www.webmin.com/jcameron-key.asc"
    apt-key add jcameron-key.asc
}