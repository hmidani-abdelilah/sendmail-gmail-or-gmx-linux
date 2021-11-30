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
       echo -e "'\033[0;36m' example: '\033[0;31m'" sudo $0
    exit
fi

source ./mail-x.sh
source ./ssmt-p.sh
source ./mail-s.sh
source ./mut-t.sh
source ./mpac-k.sh
source ./test.sh

configfile=/etc/ssmtp/ssmtp.conf
if [ -f /usr/bin/dialog ] && [ -f /usr/bin/ccze ]; then
   #sudo ./$0
   echo 'File \"/usr/bin/dialog and \"/usr/bin/ccze" exists'
else
sudo apt update -y &> /dev/null
wait
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
else
echo -e '\033[0;31m'"Error not updated "'\033[0m'
fi
echo -e "'\033[0;36m' Install dialog ccze '\033[0;31m'"
sudo apt install -y dialog ccze &> /dev/null
if (( $? == 0 )); then
echo -e '\033[0;32m'"Done"'\033[0m'
sleep 2
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
            echo -e '\033[0;36m'"Allow your gmail in links"
            
        
                while :
                    do
                    echo
                    echo -e '\033[1;33m'"Enter [V/v] to view [m/M] to return Menu: " '\033[0m' 
                    read CAR
                    case $CAR in
                        v|V)
                            echo
                            echo -e '\033[0;34m'"https://myaccount.google.com/lesssecureapps"
                            echo 
                            echo -e '\033[0;34m'"https://accounts.google.com/DisplayUnlockCaptcha"
                            ;;
                        M|m)
                            sudo ./$0
                            break
                            ;;
                        *)
                            echo -e '\033[0;31m' "Sorry, I don't understand" '\033[0m'
                            ;;
                    esac
                done
            
            ;;
        2)
            if [ -f /usr/sbin/ssmtp ] && [ -f /usr/bin/mail ] && [ -f /usr/bin/mutt ] && [ -f /usr/bin/mpack ] && [ -f /usr/bin/mailx ]; then
            echo -e '\033[0;36m' "File tools are exists" '\033[0m'
            echo -e '\033[0;32m' "Return to menu..." '\033[0m'
            sleep 2
            sudo ./$0
            else
                echo -e '\033[0;31m' "Update System" '\033[0m'
                sudo apt update -y &> /dev/null
                if (( $? == 0 )); then
                echo -e '\033[0;32m'"Done"'\033[0m'
                sleep 2
                else
                echo -e '\033[0;31m'"Error not updated "'\033[0m'
                fi
                wait
                echo -e '\033[0;31m' "Install ssmtp" '\033[0m'
                sudo apt install ssmtp -y  $> /dev/null
                wait
                if (( $? == 0 )); then
                echo -e '\033[0;32m'"Done"'\033[0m'
                sleep 2
                else
                echo -e '\033[0;31m'"Error not installed "'\033[0m'
                fi  
                echo -e '\033[0;31m' "Install mailutils" '\033[0m'
                sudo apt install mailutils -y 
                wait
                if (( $? == 0 )); then
                echo -e '\033[0;32m'"Done"'\033[0m'
                sleep 2
                else
                echo -e '\033[0;31m'"Error not installed "'\033[0m'
                fi  
                echo -e '\033[0;31m' "Install mpack" '\033[0m'
                sudo apt install mpack -y 
                wait
                if (( $? == 0 )); then
                echo -e '\033[0;32m'"Done"'\033[0m'
                sleep 2
                else
                echo -e '\033[0;31m'"Error not installed "'\033[0m'
                fi  
                echo -e '\033[0;31m' "Install mutt" '\033[0m'
                sudo apt install mutt -y 
                if (( $? == 0 )); then
                echo -e '\033[0;32m'"Done"'\033[0m'
                sleep 2
                else
                echo -e '\033[0;31m'"Error not installed "'\033[0m'
                fi  
                clear
            fi
            ;;
        3)
            if [ -a ${configfile} ];then
                echo -e '\033[0;33m' "File ${configfile} exists"'\033[0m'
                echo 
                while :
                do
                    echo -e '\033[0;33m'"Do you want to edit it prese [Yes/No] and [V/v] or [View] to see content or [No/N] return :"'\033[0m' 
		            read ANSW
                    case $ANSW in
                        Y|y|yes|YES|Yes)
                            sensible-editor ${configfile}
                            ;;
                        N|n|no|NO|No)
                            sudo ./$0
                            break
                            ;;
                        V|v|view|View|VIEW)
                            cat ${configfile} | ccze -A 
                            ;;   
                        *)
                            echo -e '\033[0;31m' "Sorry, I don't understand" '\033[0m'
                            ;;
                    esac
                done
            else
                echo -e '\033[0;31m' "Enter your information:" '\033[0m'
                read -p "Enter you '(root)' name: " name 
                read -p "Enter gmail addresse AuthUser: " gmail
                read -sp "Password: " password
                echo 
                echo 
                echo -e "Your name (root) is: " '\033[1;32m' ${name} '\033[0m'
                echo -e "Your email addresse AuthUser is: " '\033[1;31m' ${gmail} '\033[0m'
                echo
                echo -e "If no correct press '\033[0;31m' ctrl+c '\033[0m' to exit and run it"
                echo
                echo -e "If you want to shake information use '\033[1;32m' ( cat ${configfile} ) '\033[0m' and edit if not correct."
                sleep 10 
                echo "root=${name}" >> ${configfile}
                echo "mailhub=smtp.gmail.com:465" >> ${configfile}
                SERVER="`hostname`"
                echo "hostname=${SERVER}" >> ${configfile}
                echo "FromLineOverride=YES" >> ${configfile}
                echo "AuthUser=${gmail}" >> ${configfile}
                echo "AuthPass=${password}" >> ${configfile}
                echo "UseTLS=YES" >> ${configfile}
            fi
            ;;
        4)
            echo "Check your config:"
                while :
                    do
                    echo
                    echo -e '\033[1;33m'"Enter [V/v] to view [m/M] to return Menu: " '\033[0m' 
                    read CAR
                    case $CAR in
                        v|V)
                            cat ${configfile} | ccze -A
                            ;;
                        M|m)
                            sudo ./$0
                            break
                            ;;
                        *)
                            echo -e '\033[0;31m' "Sorry, I don't understand" '\033[0m'
                            ;;
                    esac
                done
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
esac
