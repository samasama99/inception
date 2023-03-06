#!/bin/bash

set -x

service vsftpd start

adduser --gecos "" xxx;

echo "xxx:xxx" | chpasswd;

mkdir -p /home/xxx/ftp/;

chown -R "xxx:xxx" /home/xxx/;

echo "xxx" >> /etc/vsftpd.userlist

service vsftpd stop

vsftpd