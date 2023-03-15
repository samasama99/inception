FROM debian:buster-slim

RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./tools/setup-mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-mariadb.sh

ENTRYPOINT ["bash", "/usr/local/bin/setup-mariadb.sh"]