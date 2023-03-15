FROM debian:buster-slim

RUN apt-get -y update
RUN apt-get -y install curl
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o cadvisor; \
    chmod +x cadvisor; \
    mv cadvisor /usr/bin

ENTRYPOINT cadvisor