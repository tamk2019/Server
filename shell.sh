
#!/bin/sh
# This is a comment!
# Tällä shell skriptillä luodaan etälaitteelle palvelinympäristö
sudo apt-get install httpd
systemctl enable httpd
systemctl start httpd.service
