#! /bin/bash

if [ -f "$DB_DATADIR/mysql/user.frm" ]; then
    mariadbd-safe --port=3306 --bind-address=0.0.0.0 --datadir=$DB_DATADIR
    exit $?
fi

envsubst < /init.sql.template > /init.sql

mariadb-install-db --datadir=$DB_DATADIR --skip-test-db > /dev/null

mariadbd-safe --datadir=$DB_DATADIR --init-file=/init.sql --silent&

echo "Waiting for mariadb to init..."
until mariadb-admin -u root -p$DB_ROOT_PASSWORD shutdown --silent; do
    sleep 1
done

echo -e "Starting db"

mariadbd-safe --port=3306 --bind-address=0.0.0.0 --datadir=$DB_DATADIR