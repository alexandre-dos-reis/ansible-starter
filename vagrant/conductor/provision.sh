#!/bin/bash

apt update
apt install ansible -y

if grep -Fxq "ssh-add ~/.ssh/id_ed25519" ~/.bashrc
then
    echo "Provision to .bashrc already done !"
else
    cat ~/.add_to_bashrc >> ~/.bashrc
    echo "Provision to .bashrc added !"
fi