#!/bin/bash
# Update and install nginx
sudo apt-get update -y
sudo apt-get install -y nginx awscli
# Enable nginx to start on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Download the index.html from your private S3 bucket
sudo aws s3 cp s3://secure-webapp-assets/index.html /var/www/html/index.nginx-debian.html

# Restart nginx to load new page
systemctl restart nginx 
