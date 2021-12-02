#!/bin/bash
links () {
echo -e '\033[0;36m'"Allow your gmail in links" '\033[0m' 
echo 
echo -e '\033[0;34m'"https://myaccount.google.com/lesssecureapps" '\033[0m' 
echo 
echo -e '\033[0;34m'"https://accounts.google.com/DisplayUnlockCaptcha" '\033[0m' 
echo
echo -e '\033[1;33m'"Press any key to return Menu: " '\033[0m' 
read -rsn1 
sudo ./$0
}