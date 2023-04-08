#!/bin/bash
yum update -y
timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8
source /etc/locale.conf
amazon-linux-extras install -y nginx1 docker
yum install -y gcc-c++ make patch git openssl-devel curl vim zip unzip docker
systemctl start docker
systemctl enable docker
curl -sSL "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir /var/www
cd /var/www
aws s3 cp s3://mock-mock/mock-mock.zip mock-mock.zip
unzip mock-mock.zip
cp -r mock-mock/* ./
rm -rf mock-mock.zip mock-mock
mv mock_nginx.conf /etc/nginx/conf.d/mock_nginx.conf
systemctl start nginx
systemctl enable nginx
docker-compose up -d
