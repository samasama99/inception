FROM debian:buster

RUN apt update -y &&  apt upgrade -y
RUN apt install apache2 wget php libapache2-mod-php php-mysql -y
WORKDIR /var/www/html
RUN rm -rf *
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O index.php
RUN sed -i  's/80/8080/g' /etc/apache2/ports.conf
RUN service apache2 restart

CMD ["apachectl", "-D", "FOREGROUND"]
