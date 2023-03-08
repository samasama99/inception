#!/bin/bash

# set -e

mkdir -p var/www/html
# find var/www/html -type d -exec chmod 755 {} \;
# find var/www/html -type f -exec chmod 644 {} \;

# chown www-data:www-data var/www/html



sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download  --allow-root --path="/var/www/html" 
rm -rf /var/www/html/wp-config.php 
wp config create --dbhost="mariadb" --dbname=wordpress --dbuser=wordpress --dbpass=pass --path="/var/www/html" --allow-root --skip-check --extra-php <<_EOF
    define('WP_REDIS_HOST', 'redis');
    define('WP_REDIS_PORT', 6379);
_EOF

wp core install --url="https://localhost" --title="1337" --admin_name=wordpress --admin_password=pass --admin_email=you@example.com --path="/var/www/html" --allow-root
# wp core install --url=orahmoun.42.fr --title="1337" --admin_name=wordpress --admin_password=pass --admin_email=you@example.com --path=var/www/html --allow-root
wp user create orahmoun wordpress@gmail.com --user_pass=pass --role=author --allow-root --path="/var/www/html/"

service php7.3-fpm start

wp plugin install redis-cache --activate --path=/var/www/html --allow-root
# wp plugin activate redis-cache --path=/var/www/html --allow-root
wp redis enable --path=/var/www/html --allow-root

service php7.3-fpm stop
php-fpm7.3 -F