#!/bin/bash

sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd
groupadd -f $1
useradd \
    --create-home \
    --gid $1 \
    --shell /bin/bash \
    --password $(echo $2 | openssl passwd -1 -stdin) \
    $1
