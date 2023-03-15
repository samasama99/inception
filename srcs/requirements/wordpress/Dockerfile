FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y curl php-fpm php-mysql postfix \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY /conf/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]