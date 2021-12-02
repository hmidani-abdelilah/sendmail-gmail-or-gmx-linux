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

source ./package.sh
source ./mail-x.sh
source ./ssmt-p.sh
source ./mail-s.sh
source ./mut-t.sh
source ./mpac-k.sh
source ./links.sh
source ./configuration.sh
source ./check_config.sh


configfile=/etc/ssmtp/ssmtp.conf
if [ -f /usr/bin/dialog ] && [ -f /usr/bin/ccze ]; then
   #sudo ./$0
   echo 'File \"/usr/bin/dialog and \"/usr/bin/ccze" exists'
else
sudo apt update -y &> /dev/null
wait
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e "'\033[0;36m' Install dialog ccze '\033[0;31m'"
sudo apt install -y dialog ccze whiptail &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 1
else
echo -e '\033[0;31m'"Error not installed "'\033[0m'
fi  
fi

HEIGHT=20
WIDTH=40
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
         11 "Exit"
         12 "Test"
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
            ;;
        3)
            configuration
            ;;
        4)
            Check 
            ;;           
        5)
            echo "Edit your config"
            sensible-editor ${configfile}
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
            exit
            ;;
        12 ) testt
esac
