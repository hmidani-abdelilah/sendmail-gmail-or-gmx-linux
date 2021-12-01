#!/bin/bash

Check () {
configfile=/etc/ssmtp/ssmtp.conf
echo "Check your config:" 
cat ${configfile} | ccze -A
echo
echo
echo -e '\033[1;33m'"Press any key to return Menu: " '\033[0m' 
read -rsn1
sudo ./$0       
}