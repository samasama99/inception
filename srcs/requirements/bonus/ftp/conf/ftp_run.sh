#!/bin/bash

service vsftpd start

adduser --gecos "" ${FTP_USER};

echo "${FTP_USER}:${FTP_USER_PASS}" | chpasswd;

mkdir -p /home/${FTP_USER}/ftp/;

chown -R "${FTP_USER}:${FTP_USER}" /home/${FTP_USER}/;

echo "${FTP_USER}" >> /etc/vsftpd.userlist

sed -i "s/USER/${FTP_USER}/g" /etc/vsftpd.conf

service vsftpd stop

exec vsftpd