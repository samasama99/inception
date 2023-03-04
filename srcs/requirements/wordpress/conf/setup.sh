#!/bin/bash

set -x

mkdir -p var/www/html
find var/www/html -type d -exec chmod 755 {} \;
find var/www/html -type f -exec chmod 644 {} \;

# chown www-data:www-data var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar usr/local/bin/wp

sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download  --allow-root --path="/var/www/html" 
wp config create --dbhost="mariadb" --dbname=wordpress --dbuser=wordpress --dbpass=pass --path="/var/www/html" --allow-root --skip-check
wp core install --url="https://localhost" --title="1337" --admin_name=wordpress --admin_password=pass --admin_email=you@example.com --path="/var/www/html" --allow-root
# wp core install --url=orahmoun.42.fr --title="1337" --admin_name=wordpress --admin_password=pass --admin_email=you@example.com --path=var/www/html --allow-root
wp user create orahmoun wordpress@gmail.com --user_pass=pass --role=author --allow-root --path="/var/www/html/"
service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 -F