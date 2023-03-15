FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/www/html/*

COPY ./conf/Documents /var/www/html/Documents 
COPY ./conf/index.html /var/www/html/

ENTRYPOINT ["nginx", "-g", "daemon off;"]