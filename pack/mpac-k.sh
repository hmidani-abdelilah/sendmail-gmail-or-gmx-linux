#!/bin/bash
sendmpack () {
echo
echo "This file test mail by mpack" >> file-test.txt  
read -p "Enter received email your recepient Email: " remail    
echo -e '\033[0;33m'"Testing with MPACK"'\033[0m'
mpack -s "This is test by MPACK" ./file-test.txt ${remail}
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error"'\033[0m'
fi
rm -rf ./file-test.txt
}
##############################################
mpackk () {
if [ -f /usr/bin/mpack ]; then
sendmpack
else
echo 'File \"/usr/bin/mpack" not exists'
echo -e '\033[0;31m' "Update System" '\033[0m'
sudo ${manager} update -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e '\033[0;31m' "Install tools mpack" '\033[0m'
sudo ${manager} install mpack -y &> /dev/null || sudo ${manager} install lua-mpack -y &> /dev/null
wait
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
clear
sendmpack
fi
}