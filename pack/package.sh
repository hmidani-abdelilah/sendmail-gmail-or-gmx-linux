#!/bin/bash 

package () {
if [ -f /usr/sbin/ssmtp ] && [ -f /usr/bin/mail ] && [ -f /usr/bin/mutt ] && [ -f /usr/bin/mpack ] && [ -f /usr/bin/mailx ]; then
echo -e '\033[0;36m' "All package are installed" '\033[0m'
echo -e '\033[0;32m' "Return to menu..." '\033[0m'
sleep 1
sudo ./$0
else
echo -e '\033[0;31m' "Update System" '\033[0m'
sudo ${manager} update -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
wait
echo -e '\033[0;31m' "Install ssmtp" '\033[0m'
sudo ${manager} install ssmtp -y  &> /dev/null
wait
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
echo -e '\033[0;31m' "Install mpack" '\033[0m'
sudo ${manager} install mpack -y &> /dev/null || sudo ${manager} install lua-mpack -y &> /dev/null
wait
# mpack == lua-mpack fedora
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
echo -e '\033[0;31m' "Install mutt" '\033[0m'
sudo ${manager} install mutt -y &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi
echo -e '\033[0;31m' "Install mailutils" '\033[0m'
sudo ${manager} install mailutils -y &> /dev/null || sudo ${manager} install mailx -y &> /dev/null
wait
# mailutils == mailx fedora
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi    
clear
fi
}