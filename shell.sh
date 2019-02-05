#!/bin/sh
#Install fortune-mod application
sudo apt-get install fortune-mod -y
#Run fortune application
fortune
#Remove fortune-mode application
sudo apt-get --purge remove fortune-mod -y
