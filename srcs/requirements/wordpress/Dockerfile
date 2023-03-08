FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install curl php-fpm php-mysql postfix 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar usr/local/bin/wp

COPY ./conf/setup.sh /

CMD bash setup.sh

