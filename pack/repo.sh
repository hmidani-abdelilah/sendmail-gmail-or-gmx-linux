#!/bin/bash

repo() {
    sudo dnf update -y &> /dev/null
    sudo dnf install epel-release -y &> /dev/null
    wait
    sudo dnf upgrade -y &> /dev/null
    wait
    sudo ./$0
}