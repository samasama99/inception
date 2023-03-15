FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    apache2 \
    wget \
    php \
    libapache2-mod-php \
    php-mysql \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
RUN rm -rf *
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O index.php

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]