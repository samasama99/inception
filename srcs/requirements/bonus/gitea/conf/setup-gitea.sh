#!/bin/bash



adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

mkdir -p /etc/gitea /var/lib/gitea/{custom,data,indexers,public,log}
chown git:git /var/lib/gitea/{data,indexers,log}
chmod 750 /var/lib/gitea/{data,indexers,log}
chown root:git /etc/gitea
chmod 770 /etc/gitea
chown -R git:git /usr/local/bin

cat > /etc/systemd/system/gitea.service <<_EOF
[Unit]
Description=Gitea (Git with a cup of tea)
After=syslog.target
After=network.target
After=mysql.service

[Service]
LimitMEMLOCK=infinity
LimitNOFILE=65535
RestartSec=2s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/
ExecStart=/usr/local/bin/gitea web -c /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

[database]
DB_TYPE  = mysql
HOST     = mariadb:3306
NAME     = gitea
USER     = gitea
PASSWD   = gitea
SSL_MODE = disable

[Install]
WantedBy=multi-user.target
_EOF

chown git:git /etc/systemd/system/gitea.service

cat > /etc/gitea/app.ini <<_EOF
APP_NAME = Gitea

[server]
DOMAIN           = localhost
HTTP_PORT        = 3000
ROOT_URL         = http://localhost:3000/
DISABLE_SSH      = false
SSH_PORT         = 22

[database]
DB_TYPE          = mysql
HOST             = mariadb:3306
NAME             = gitea
USER             = gitea
PASSWD           = gitea
SSL_MODE         = disable
PATH             = data/gitea.db

[repository]
ROOT             = /data/git/repositories

[security]
INSTALL_LOCK     = true
SECRET_KEY       = your_secret_key_here

[mailer]
ENABLED          = false
_EOF

chown git:git /etc/gitea/app.ini
# /usr/local/bin/custom/conf/app.ini

set -m

setcap 'cap_net_bind_service=+ep'  /usr/local/bin/gitea

# chown -R git:git /var/lib/gitea /var/log/gitea /etc/gitea
# chmod -R 750 /var/lib/gitea /var/log/gitea /etc/gitea
runuser -l git -c 'gitea web --config "/etc/gitea/app.ini"' &
# runuser -l git -c 'gitea admin user create --admin --username test --email test@test.com --password pass1234 --config /etc/gitea/app.ini' 
# runuser -l git -c 'gitea login --url http://localhost:3000 --username admin --password admin1234' 
# runuser -l git -c 'gitea repo create myrepo --description "wordpress" --private --default-branch main' 
# cd myrepo
# echo "<html><body><h1>Hello, world!</h1></body></html>" > index.html
# git add index.html
# git commit -m "Added index.html"
# git push origin main

fg
# runuser -l git -c 'gitea web --config "/etc/gitea/app.ini"' &
# runuser -l git -c 'gitea admin user create --admin --username test --email test@test.com --password pass1234 --config /etc/gitea/app.ini'

# pkill gitea

# runuser -l git -c 'gitea web'


# kill gitea

# runuser -l git -c 'gitea web'