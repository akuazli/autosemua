#---------------------------------------------------------------------
# Function: InstallWebmin
#    Install webmin package
#---------------------------------------------------------------------
InstallWebmin() {
    echo -n "Installing webmin package... "
    apt-get -qqy install apt-transport-https
    apt-get -qq update
    apt-get -qqy install webmin
    echo -e "[${green}DONE${noclr}]"

    echo -n "Configure webmin package... "
    sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
    echo -e "[${green}DONE${noclr}]"
}