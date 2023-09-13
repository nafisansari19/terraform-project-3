#!/bin/bash

#Update all yum package repositories
sudo yum update -y

#Install Apache Web Server
sudo yum install -y httpd.x86_64

#Start and Enable Apache Web Server
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata 
sudo yum install php-cli php-pdo php-fpm php-json php-mysqlnd -y
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/ 
sudo chown -R apache:apache /var/www/html
sudo systemctl restart httpd