FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install curl wget git
RUN apt-get -y install libcap2-bin
RUN curl -s  https://api.github.com/repos/go-gitea/gitea/releases/latest |grep browser_download_url  |  cut -d '"' -f 4  | grep '\linux-amd64$' | wget -i -
RUN chmod +x gitea-*-linux-amd64 && \
    mv gitea-*-linux-amd64 /usr/local/bin/gitea
RUN apt-get -y install psmisc
COPY ./conf/setup-gitea.sh /

CMD bash /setup-gitea.sh 

# CMD gitea --version