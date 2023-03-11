FROM debian:buster

RUN  apt-get -y update &&  apt-get -y upgrade
RUN  apt-get -y install nginx

RUN  rm /var/www/html/*
ADD  ./conf/Documents /var/www/html/Documents 
COPY ./conf/index.html /var/www/html

CMD nginx -g 'daemon off;'