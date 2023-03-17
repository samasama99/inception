FROM debian:buster-slim

RUN apt-get update && apt-get install -y nginx curl openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/

COPY ./conf/run-nginx.sh /

ENTRYPOINT ["bash", "/run-nginx.sh"]