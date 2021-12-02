#!/bin/bash
sendssmtp () {
echo
read -p "Enter received email your recepient Email: " remail 
echo 
echo -e '\033[0;33m'"Testing with SSMTP "'\033[0m'
echo "E-Mail testing SSMTP" | ssmtp ${remail}
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error"'\033[0m'
fi
}
######################################
ssmtpp () {
if [ -f /usr/sbin/ssmtp ]; then
sendssmtp
else
echo 'File \"/usr/sbin/ssmtp" exists'
echo -e '\033[0;31m' "Update System" '\033[0m'
sudo apt update -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e '\033[0;31m' "Install tools ssmtp" '\033[0m'
sudo apt install ssmtp -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
clear
sendssmtp
fi
}