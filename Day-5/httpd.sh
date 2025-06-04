#! /bin/bash

# update the linux terminal console
sudo yum update -y 
# install the htttpd web server
sudo yum install httpd -y 
# start the httpd webserver
sudo service httpd start  
# enable the httpd webserver
sudo systemctl enable httpd 
 # create index.html file and write the data
echo "<h1>welcome to aws cloud</h1>" > /var/www/html/index.html