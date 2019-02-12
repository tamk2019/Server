#!/bin/sh
echo 'Ladataan ja asennetaan sshpass helppoa yhteyden luontia varten..'
sudo apt-get install sshpass -y
echo 'Asennus valmis!'
sshpass -p 'Tamk1234' ssh pi@89.106.37.88 < install_apache.sh