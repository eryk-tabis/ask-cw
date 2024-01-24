#!/bin/bash

APP_URL=${APP_URL:-"https://github.com/jkanclerz/e-commerce-pp4/releases/download/v.0.3/application.jar"}
APP_DIR=/opt/ecommerce
APP_NAME=${APP_NAME:-ecommerce}



PACKAGES_TO_BE_INSTALLED="mc cowsay tree"
dnf install -y -q ${PACKAGES_TO_BE_INSTALLED}

dnf install -y -q java-17-amazon-corretto

mkdir -p ${APP_DIR}

## install .jar

wget ${APP_URL} -O ${APP_DIR}/app.jar

serviceTemplate="
[Unit]
Description=${APP_NAME}
After=network-online.target

[Service]
Type=simple
User=root
ExecStart=java -Dserver.port=80 -jar ${APP_DIR}/app.jar
Restart=always

[Install]
WantedBy=multi-user.target
"

echo -e "$serviceTemplate" > /etc/systemd/system/${APP_NAME}.service

systemctl daemon-reload
systemctl enable ${APP_NAME}
systemctl restart ${APP_NAME}



cowsay "it works"