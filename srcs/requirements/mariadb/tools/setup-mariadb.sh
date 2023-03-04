#!/bin/bash

set -x

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

if [ -d "/var/lib/mysql/${DB_NAME}" ]
then
   echo "Database '${DB_NAME}' already exists."
else
    service mysql start
    mysql -e "CREATE DATABASE ${DB_NAME};"
    mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}' IDENTIFIED BY '${DB_USER_PASS}' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}' WITH GRANT OPTION;"
fi

service mysql stop
service mysql stop

mysqld_safe