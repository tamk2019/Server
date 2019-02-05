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
echo "I will create you a file called ${USER_NAME}_file, oh noble knight of ${QUEST}"
touch "${USER_NAME}_file"
