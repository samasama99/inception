FROM debian:buster

RUN  apt-get -y update &&  apt-get -y upgrade
RUN  apt-get -y install nginx
RUN  apt-get -y install vim curl
RUN  apt-get -y install openssl
RUN  mkdir ssl_cert
WORKDIR /ssl_cert
RUN  openssl req -x509 -newkey rsa:4096 -keyout cert.key -out cert.pem -days 365 -nodes -subj "/C=MA/ST=none/L=KH/O=My Organization/CN=orahmoun.42.fr"
WORKDIR /

COPY ./conf/nginx.conf /etc/nginx/

CMD nginx -g 'daemon off;'