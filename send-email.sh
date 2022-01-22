#!/bin/bash

######################################################################################
#                                                                                    #
# Coded by: HMIDANI ABDELILAH @2021                                                  #
# Github: https://github.com/hmidani-abdelilah/                                      #
#                                                                                    #
# This script for send mail by cli linux server                                      #
#                                                                                    #
######################################################################################
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
        echo 
       echo -e '\033[0;36m' "example:" '\033[0;31m' " sudo $0 "
    exit
fi

source ./pack/package.sh
source ./pack/mail-x.sh
source ./pack/ssmt-p.sh
source ./pack/mail-s.sh
source ./pack/mut-t.sh
source ./pack/mpac-k.sh
source ./pack/links.sh
source ./pack/configuration.sh
source ./pack/check_config.sh
source ./pack/repo.sh

declare -A osInfo;
osInfo[/etc/redhat-release]=dnf
#osInfo[/etc/arch-release]=pacman
#osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        manager=${osInfo[$f]}
    fi
done


configfile=/etc/ssmtp/ssmtp.conf
if [ -f /usr/bin/dialog ] && [ -f /usr/bin/ccze ] && [ -f /bin/whiptail ] && [ -f /usr/bin/vim ]; then
   #sudo ./$0
   echo 'File \"/usr/bin/dialog and \"/usr/bin/ccze" \"/bin/whiptail" exists'
else
sudo ${manager} update -y  &> /dev/null
wait
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e "'\033[0;36m' Install dialog ccze vim '\033[0;31m'"
sudo ${manager} install dialog ccze vim -y  &> /dev/null
wait 
sudo ${manager} install whiptail -y &> /dev/null || sudo ${manager} install newt -y  &> /dev/null
# whiptail == newt fedora
wait
sleep 5
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
fi

HEIGHT=20
WIDTH=48
CHOICE_HEIGHT=8
BACKTITLE="sending mail by cli using gmail"
TITLE="install & configure mail tools"
MENU="Choose one of the following options:"

OPTIONS=(1 "Allow your gmail in links"
         2 "Install tools mail"
         3 "Entre config"
         4 "Check your config"
         5 "Edit your config"
         6 "Test mailx"
         7 "Test SSMTP"
         8 "Test mails"
         9 "Test mpack"
         10 "Test mutt"
         11 "Enable repo epel-release Redhat based"
         12 "Exit"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            links
            ;;
        2) 
            package
            sudo ./$0
            ;;
        3)
            configuration
            sudo ./$0
            ;;
        4)
            Check 
            ;;           
        5)
            echo "Edit your config"
            sensible-editor ${configfile} 2> /dev/null || vim  ${configfile} 2> /dev/null
            ;;
        6 )  
            mailxx
            sudo ./$0
            ;;
        7 ) 
            ssmtpp
            sudo ./$0
            ;;
        8 ) 
            mailss
            sudo ./$0
            ;;
        9 ) 
            mpackk
            sudo ./$0
            ;;
        10 )
            muttt
            sudo ./$0
            ;;
        11 ) 
            repo
            ;;
        12 ) 
            exit
            ;;
esac
