#!/bin/sh
#Install sshpass for server login
sudo apt-get install sshpass
#Login to server and run shell.sh script on the server
sshpass -p 'Tamk1234' ssh pi@89.106.37.88 < shell.sh

