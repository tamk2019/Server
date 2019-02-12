#!/bin/bash

SERVER_IP=192.168.1.127
USERNAME=
PASSWORD=
REMOTE_PASSWORD=password

# Check that sshpass exists, if not => exit
if  [ -x "$(sshpass -V)" ]; then
    echo "SSHPASS not found, installing"
    sudo apt install sshpass -y
fi

if [ -n "$1" ]; then
    SERVER_IP=${1}
else
    echo "IP address not supplied, using default."
fi

function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat}

# Validate IP address
if valid_ip ${SERVER_IP}; then 
    echo "Using IP address: ${SERVER_IP}"
else
    echo "Not a valid IP, exiting"
    exit 1
fi

function install_nginx () {
    # Connect to server
    echo "Connecting to server and installing Nginx"
    sshpass -p ${PASSWORD} ssh -t ${USERNAME}@${SERVER_IP} "echo ${REMOTE_PASSWORD} | sudo -S apt install nginx -y"
    echo "Install complete, exiting remote server"
}

function uninstall_nginx () {
    # Connect to server
    echo "Connecting to server uninstalling Nginx"
    sshpass -p ${PASSWORD} ssh -t ${USERNAME}@${SERVER_IP} "echo ${REMOTE_PASSWORD} | sudo -S apt --purge autoremove nginx -y"
    echo "Uninstall complete, exiting remote server"
}

while true
do
echo ""
PS3='Please enter your choice: '
OPTIONS=("Install Nginx" "Uninstall Nginx" "Quit")
select OPT in "${OPTIONS[@]}"
do
    case ${OPT} in
        "Install Nginx")
            install_nginx
            break
            ;;
        "Uninstall Nginx")
            uninstall_nginx
            break
            ;;
        "Quit")
            echo "Exiting script"
            exit 0
            ;;
        *) echo "Invalid option ${REPLY}, try again";;
    esac
done
done