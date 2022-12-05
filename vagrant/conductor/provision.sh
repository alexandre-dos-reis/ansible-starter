#!/bin/bash

apt update
apt install ansible -y
apt install sshpass -y

if grep -Fxq "cd ~/synced_folder" /home/vagrant/.bashrc; then
    echo "Provision to .bashrc already done !"
else
    cat /home/vagrant/.add_to_bashrc >> /home/vagrant/.bashrc
    echo "Provision to .bashrc added !"
fi
