#! /bin/bash

useradd $SERVER -d /home/$SERVER
echo "$SERVER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
chown -R $SERVER:$SERVER /home/$SERVER

su - $SERVER -w "SERVER,PASSWORD" -c "/setup.sh"
