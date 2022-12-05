#!/bin/bash

# $1 is the username
# $2 is the password in clear text.

sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd
groupadd -f $1
useradd \
    --create-home \
    --gid $1 \
    --groups sudo \
    --shell /bin/bash \
    --password $(echo $2 | openssl passwd -1 -stdin) \
    $1
