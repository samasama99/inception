FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/ftp_run.sh /etc/

CMD ["bash", "/etc/ftp_run.sh"]