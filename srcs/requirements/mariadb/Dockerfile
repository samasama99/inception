FROM   debian:buster

RUN apt-get -y update && apt-get -y upgrade

RUN     apt-get -y install mariadb-server

COPY   ./tools/setup-maria-db.sh /usr/local/bin

RUN    chmod a+x /usr/local/bin/setup-maria-db.sh

CMD    bash /usr/local/bin/setup-maria-db.sh
