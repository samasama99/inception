FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install curl php-fpm php-mysql postfix 

COPY ./conf/setup.sh /

CMD bash setup.sh

