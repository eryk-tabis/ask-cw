#!/bin/bash

repoCfg="
[mariadb]
name = MariaDB
baseurl = https://ftp.bme.hu/pub/mirrors/mariadb/yum/11.1/centos/9.2/x86_64
gpgkey = https://ftp.bme.hu/pub/mirrors/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck = 1"

echo -e "$repoCfg" > /etc/yum.repos.d/Mariadb.repo

dnf install -y MariaDB-server MariaDB-client

systemctl start mariadb
systemctl enable mariadb