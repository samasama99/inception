FROM debian:buster-slim

RUN apt-get update && apt-get install -y nginx curl openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ssl_cert && \
    openssl req -x509 -newkey rsa:4096 -keyout /ssl_cert/cert.key -out /ssl_cert/cert.pem -days 365 -nodes -subj "/C=MA/ST=none/L=KH/O=My Organization/CN=orahmoun.42.fr"

COPY ./conf/nginx.conf /etc/nginx/

ENTRYPOINT ["nginx", "-g", "daemon off;"]