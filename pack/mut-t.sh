#!/bin/bash
sendmutt () {
echo
read -p "Enter received email your recepient Email: " remail
wait
echo "This file test mail" >> file-test.txt     
wait       
echo -e '\033[0;33m'"Testing with MUTT"'\033[0m'
echo "testing message with MUTT" | mutt -s "message subject test mutt" -a file-test.txt -- ${remail}
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error"'\033[0m'
fi
rm -rf file-text.txt
}
################################################
muttt () {
if [ -f /usr/bin/mutt ]; then
sendmutt
else
echo 'File \"/usr/bin/mutt" exists'
echo -e '\033[0;31m' "Update System" '\033[0m'
sudo ${manager} update -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e '\033[0;31m' "Install tools mutt" '\033[0m'
sudo ${manager} install mutt -y  &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
clear
sendmutt
fi
}
