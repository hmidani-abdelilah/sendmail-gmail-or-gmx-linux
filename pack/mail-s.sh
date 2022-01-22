#!/bin/bash

sendmails (){
echo
read -p "Enter received email your recepient Email: " remail 
echo -e '\033[0;33m'"Testing with MAIL "'\033[0m'
echo "This is test by MAILS" | mail -s "Test by MAILS" ${remail}
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error"'\033[0m'
fi
}
#######################################
mailss () {
if [ -f /usr/bin/mail ]; then
sendmails
else
echo 'File \"/usr/bin/mail" exists'
echo -e '\033[0;31m' "Update System" '\033[0m'
sudo ${manager} update -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e '\033[0;31m' "Install tools mail" '\033[0m'
sudo ${manager} install mailutils -y &> /dev/null || sudo ${manager} install mailx -y &> /dev/null 
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
clear
sendmails
fi
}