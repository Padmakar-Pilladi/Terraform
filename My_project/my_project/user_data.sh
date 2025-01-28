#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "	MINI PROJECT WITH TERRAFORM from $(hostname) SERVER" > /var/www/html/index.html