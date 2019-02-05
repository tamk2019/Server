#!/bin/sh
# This is a comment!
# Tällä shell skriptillä luodaan etälaitteelle palvelinympäristö
echo Hello World
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "What is your quest?"
read QUEST
echo "What is the average flight velocity of an unlaiden swallow?"
echo "Neve mind, ${USER_NAME} of ${QUEST}, I'll just start the apache server."


systemctl start apache2.service
