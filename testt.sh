#!/bin/bash
tesst () {
whiptail --msgbox "Enter your information send email ." --fb --title "Configuration send email information" 10 100
name=$(whiptail --inputbox "Enter you '(root)' name" 10 100 3>&1 1>&2 2>&3)
gmail=$(whiptail --inputbox "Enter gmail addresse AuthUser:" 10 100 3>&1 1>&2 2>&3)
password=$(whiptail --passwordbox "Please enter your password" 10 100 3>&1 1>&2 2>&3)
echo "name:$name"
echo "GMAIL:$gmail"
echo "name:$password"

sleep 5
 }