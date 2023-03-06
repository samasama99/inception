FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y vsftpd

COPY /conf/vsftpd.conf /etc/vsftpd.conf

COPY /conf/ftp_run.sh /etc

CMD bash /etc/ftp_run.sh