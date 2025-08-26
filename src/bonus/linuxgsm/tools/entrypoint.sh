#! /bin/bash

useradd $SERVER -d /home/$SERVER
echo "$SERVER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
chown -R $SERVER:$SERVER /home/$SERVER

su - $SERVER <<EOF
cd
if [ ! -f ./$SERVER ]; then
    echo "$SERVER not installed"
    curl -Lo linuxgsm.sh https://linuxgsm.sh
    chmod +x linuxgsm.sh
    bash linuxgsm.sh $SERVER
else
    echo "$SERVER already installed"
fi

echo "installing dependencies..."
./$SERVER auto-install > /dev/null

sed -i "s/serverpassword=\"\"/serverpassword=\"$PASSWORD\"/" lgsm/config-lgsm/vhserver/_default.cfg

echo "Starting $SERVER"
./$SERVER start
sleep 5
./${GAMESERVER} details
tail -f log/script/*
EOF