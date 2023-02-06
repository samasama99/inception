#!/bin/bash

sed -i 's/#port                   = 3306/port                   = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


service  mysql start 

mariadb -e "UPDATE mysql.user SET Password = PASSWORD('azerty999') WHERE User = 'root'"
mariadb -e "FLUSH PRIVILEGES"

exec mysqld_safe
