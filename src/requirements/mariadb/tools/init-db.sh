#!/bin/sh

envsubst < /init.sql.template > /init.sql

rc-service mariadb start

sleep 5

mariadb < /init.sql

mariadb-admin -u root -p$DB_ROOT_PASSWORD shutdown

mariadbd-safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'