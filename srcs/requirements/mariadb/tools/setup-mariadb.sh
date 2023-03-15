#!/bin/bash

if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_USER_PASS" ]; then
    echo "Error: One or more required environment variables are not set"
    exit 1
fi

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start
mysql -e "CREATE DATABASE ${DB_NAME};"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}' IDENTIFIED BY '${DB_USER_PASS}' WITH GRANT OPTION;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}' WITH GRANT OPTION;"
mysqladmin shutdown -p${DB_ROOT_PASS} 

exec mysqld_safe