FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install php libapache2-mod-php php-mysql

WORKDIR  /var/www/html
RUN wget http://wordpress.org/latest.tar.gz \
    && tar xfz latest.tar.gz \
    && mv wordpress/* ./ \
    && rm -f latest.tar.gz \
    && rm index.html \
    && cp wp-config-sample.php wp-config.php
# todo wp-config-setup

