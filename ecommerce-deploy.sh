#!/bin/bash

#################################Variable Declaration###############################
SOURCE_ZIP=$3
DESTINATION=$2
####################### Unzip File into specified directory#########################
echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
sudo cp  /var/lib/jenkins/jobs/Ecomm_project_CI/workspace/ecommerce-cd.zip /opt/rh/httpd24/root/var/www/html

cd /opt/rh/httpd24/root/var/www/html
 unzip -do ecommerce-cd ecommerce-cd.zip
echo "Wait!! Let me go to web server directory"
cd /opt/rh/httpd24/root/var/www/html/
sleep 5
echo "Giving executable permission to artifact"
sudo chmod -R 777 ecommerce-cd
rm -rf ecommerce-cd.zip
echo "###################################################"
echo " Adding Host Entry in hosts file"
echo "##################################################"
echo  "127.0.0.1 ecommerce-cd">> sudo /etc/hosts
echo "##################################################"
echo "Restart Apache"
echo "######################################################"
sudo service httpd24-httpd graceful
echo "success Check your site by typing ecommerce-cd in browser"
echo "###############################################"
cd /opt/rh/httpd24/root/etc/httpd/conf.d/
#rm -rf ecommerce-cd.conf

