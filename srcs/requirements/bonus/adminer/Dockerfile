FROM debian:buster

RUN apt-get update -y &&  apt-get upgrade -y
RUN apt-get install apache2 wget php libapache2-mod-php php-mysql -y
WORKDIR /var/www/html
RUN rm -rf *
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O index.php
RUN service apache2 stop

CMD ["apachectl", "-D", "FOREGROUND"]
