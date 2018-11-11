#---------------------------------------------------------------------
# Function: InstallFail2ban
#    Install and configure fail2ban
#---------------------------------------------------------------------
InstallFail2ban() {
  echo -n "Installing fail2ban... "
  apt-get -y install fail2ban > /dev/null 2>&1
  service fail2ban restart > /dev/null 2>&1
  echo -e "[${green}DONE${NC}]\n"
}

