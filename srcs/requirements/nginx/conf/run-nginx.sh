#/bin/sh

mkdir -p /ssl_cert

openssl req -x509 -newkey rsa:4096 -keyout /ssl_cert/cert.key -out /ssl_cert/cert.pem -days 365 -nodes -subj "/C=MA/ST=none/L=KH/O=My Organization/CN=orahmoun.42.fr"

sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/g" /etc/nginx/nginx.conf

exec nginx -g "daemon off;"