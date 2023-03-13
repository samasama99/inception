FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o cadvisor; \
    chmod +x cadvisor; \
    mv cadvisor /usr/bin

CMD cadvisor