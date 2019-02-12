#!/bin/sh
sudo apt-get install apache2 -y
# Avaa alla oleva kommentti auki, jos haluat asennuksen jalkeen poistaa apachen
service apache2 start
service apache2 stop
sudo apt-get --purge remove apache2 -y