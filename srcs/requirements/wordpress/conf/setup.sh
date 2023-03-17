#!/bin/bash

if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_USER_PASS" ] || [ -z "$REDIS_HOST" ] || [ -z "$REDIS_PORT" ] || [ -z "$WP_ADMIN" ] || [ -z "$WP_ADMIN_PASS" ] || [ -z "$WP_USER" ] || [ -z "$WP_PASS" ]; then
    echo "Error: One or more required environment variables are not set"
    exit 1
fi

mkdir -p /var/www/html

sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download  --allow-root --path="/var/www/html" 
rm -rf /var/www/html/wp-config.php 
wp config create --dbhost="mariadb" --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASS} --path="/var/www/html" --allow-root --skip-check --extra-php <<_EOF
    define('WP_REDIS_HOST', "${REDIS_HOST}");
    define('WP_REDIS_PORT', "${REDIS_PORT}");
_EOF

wp core install --url="https://${DOMAIN_NAME}" --title="1337" --admin_name=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=you@example.com --path="/var/www/html" --allow-root
wp user create ${WP_USER} wordpress@gmail.com --user_pass=${WP_PASS} --role=author --allow-root --path="/var/www/html/"

wp plugin install redis-cache --activate --path=/var/www/html --allow-root
wp redis enable --path=/var/www/html --allow-root

service php7.3-fpm start
service php7.3-fpm stop
exec php-fpm7.3 -F