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

CONF_PATH=~/lgsm/config-lgsm/$SERVER/

echo creating config
cat < $CONF_PATH/_default.cfg > $CONF_PATH/$SERVER.cfg
sed -i "s/serverpassword=\"\"/serverpassword=\"$PASSWORD\"/" $CONF_PATH/$SERVER.cfg

echo "Starting $SERVER"
./$SERVER start
./${GAMESERVER} details
tail -n 3 -q -f ~/log/script/
EOF