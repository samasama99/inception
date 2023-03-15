FROM debian:buster-slim

RUN apt-get update -y
RUN apt-get install apache2 wget php libapache2-mod-php php-mysql -y
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
RUN rm -rf *
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O index.php

CMD ["apachectl", "-D", "FOREGROUND"]