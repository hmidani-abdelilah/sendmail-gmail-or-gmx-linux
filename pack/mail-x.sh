#!/bin/bash

sendmailx () {
filehtml=file-html1.html
echo
read -p "Enter received email your recepient Email: " remail
echo "<html>" >>  ./${filehtml}
echo "<body>" >>  ./${filehtml}
echo "<h2> Email Sending by mailx file HTML </h2>" >> ./${filehtml}
echo "<font size="3" color="red">Sending email by using mailx</font>" >>  ./${filehtml}
echo "</body>" >>  ./${filehtml}
echo "</html>" >>  ./${filehtml}
echo
echo -e '\033[0;33m'"Testing with MAILX"'\033[0m'
mailx -a 'Content-Type: text/html' -s "Sending email by using mailx " <  ./${filehtml} "${remail}"
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error"'\033[0m'
fi
rm -rf ${filehtml}
}
#################################
mailxx () {
if [ -f /usr/bin/mailx ]; then
sendmailx
else
echo 'File \"/usr/bin/mailx" exists'
echo -e '\033[0;31m' "Update System" '\033[0m'
sudo ${manager} update -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e '\033[0;31m' "Install tools mailx" '\033[0m'
sudo ${manager} install mailutils -y &> /dev/null || sudo ${manager} install mailx -y &> /dev/null
wait
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
clear
sendmailx
fi
}