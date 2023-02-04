#!/bin/bash
#
#VARIABLES:
# PASSWORD="azerty1234"
#CMDS:
# sed -i '19s/./port         = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i '28s/./bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed 's/#port                   = 3306/port                   = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


service  mysql start 

mariadb -e "UPDATE mysql.user SET Password = PASSWORD('CHANGEME') WHERE User = 'root'"
mariadb -e "FLUSH PRIVILEGES"

echo "FINISHED!"
