FROM   debian:buster

RUN    apt-get -y update && apt-get -y upgrade

RUN    apt-get -y install mariadb-server

COPY   ./tools/setup-mariadb.sh /usr/local/bin

CMD    bash /usr/local/bin/setup-mariadb.sh