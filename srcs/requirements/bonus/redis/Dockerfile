FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install redis-server 

RUN sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf \
    && sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf

CMD redis-server