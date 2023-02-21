#!/bin/bash

sed -i 's/#port                   = 3306/port                   = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf



if mariadb -e "USE wordpress" ; then
    echo "Database 'wordpress' already exists."
else
    service mysql start
    echo "CREATE DATABASE wordpress;" | mysql
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;" | mysql
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;" | mysql
    service mysql stop



    # echo -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost'; FLUSH PRIVILEGES;" | mysql
    # echo -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='wordpress'; FLUSH PRIVILEGES;" | mysql
    # echo -e "UPDATE mysql.user SET Password = PASSWORD('new_password') WHERE User = 'wordpress' AND Host = 'localhost'; FLUSH PRIVILEGES;" | mysql
    # echo -e "UPDATE mysql.user SET Password = PASSWORD('azerty999') WHERE User = 'root'; FLUSH PRIVILEGES;" | mysql

    # mariadb -e "UPDATE mysql.user SET Password = PASSWORD('azerty999') WHERE User = 'root'; FLUSH PRIVILEGES;"
    # mariadb -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='wordpress'; FLUSH PRIVILEGES;"
    # mariadb -e "UPDATE mysql.user SET Password = PASSWORD('new_password') WHERE User = 'wordpress' AND Host = 'localhost'; FLUSH PRIVILEGES;"
    # mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'srcs_adminer_1.srcs_wpsite' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
    # mariadb -e "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost'; FLUSH PRIVILEGES;"


    # mariadb -e "UPDATE mysql.user SET Password = PASSWORD('azerty999') WHERE User = 'root'"
    # mariadb -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'pass';"
    # mariadb -e "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost';"
    # mariadb -e "FLUSH PRIVILEGES"
fi

exec mysqld_safe
