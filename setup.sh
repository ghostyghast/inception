# Script to install requirements in vm
echo "# DB User info
MARIADB_ROOT_PASSWORD=
MARIADB_PASSWORD=
MARIADB_USER=
# DB Info
MARIADB_DATABASE=
MARIADB_HOSTNAME=mariadb
MARIADB_DATADIR="/var/lib/mysqld"

# Wordpress Info
WP_ADMIN=
WP_ADMIN_PASSWORD=
WP_USER=
WP_USER_PASSWORD=" > src/.env
sudo apt install make docker docker-compose