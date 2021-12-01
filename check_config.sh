#!/bin/bash

Check () {
    configfile=/etc/ssmtp/ssmtp.conf
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
}