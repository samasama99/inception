!/bin/bash

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;

if [ -d "/var/lib/mysql/wordpress" ]
then
   echo "Database 'wordpress' already exists."
else
    service mysql start
	sleep 1
    mysql -e "CREATE DATABASE wordpress;"
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
fi

service mysql stop
sleep 1

exec mysqld_safe