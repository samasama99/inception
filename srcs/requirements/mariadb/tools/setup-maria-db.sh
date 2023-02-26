#!/bin/bash

if [ -d "/var/lib/mysql/wordpress" ]
then
   echo "Database 'wordpress' already exists."
else
    service mysql start
	sleep 1
    mysql -e "CREATE DATABASE wordpress;"
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
    service mysql stop
	sleep 1
fi

exec mysqld_safe --bind-address=0.0.0.0