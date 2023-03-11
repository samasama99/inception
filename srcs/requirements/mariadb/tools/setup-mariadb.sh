#!/bin/bash

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# echo ${DB_NAME} 

# if [ -d "/var/lib/mysql/${DB_NAME}" ]
# then
#    echo "Database '${DB_NAME}' already exists."
# else
    service mysql start
    mysql -e "CREATE DATABASE ${DB_NAME};"
    mysql -e "CREATE DATABASE gitea;"
    mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}' IDENTIFIED BY '${DB_USER_PASS}' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON gitea.* TO 'gitea' IDENTIFIED BY 'gitea' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}' WITH GRANT OPTION;"
    mysqladmin shutdown -p${DB_ROOT_PASS} 
# fi


mysqld_safe
#    - GITEA__database__DB_TYPE=mysql
#       - GITEA__database__HOST=mariadb:3306
#       - GITEA__database__NAME=gitea
#       - GITEA__database__USER=gitea
#       - GITEA__database__PASSWD=gitea