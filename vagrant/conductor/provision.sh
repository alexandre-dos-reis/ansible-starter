#!/bin/bash

apt update
apt install ansible -y
apt install sshpass -y

ANSIBLE_USER=ansible
ANSIBLE_PASSWORD=ansible

groupadd -f $ANSIBLE_USER
useradd \
    --create-home \
    --gid $ANSIBLE_USER \
    --groups sudo \
    --shell /bin/bash \
    --password $(echo $ANSIBLE_PASSWORD | openssl passwd -1 -stdin) \
    $ANSIBLE_USER

if grep -Fxq "ssh-add ~/.ssh/ansible" /home/$ANSIBLE_USER/.bashrc; then
    echo "Provision to .bashrc already done !"
else
    cat /home/$ANSIBLE_USER/.add_to_bashrc >> /home/$ANSIBLE_USER/.bashrc
    echo "Provision to .bashrc added !"
fi
