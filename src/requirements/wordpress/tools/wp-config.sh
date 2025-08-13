#! /bin/sh

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/$MARIADB_DATABASE/" /var/www/html/wp-config.php
sed -i "s/password_here/$MARIADB_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/username_here/$MARIADB_USER/" /var/www/html/wp-config.php
sed -i "s/localhost/$MARIADB_HOSTNAME/" /var/www/html/wp-config.php

php-fpm83 -F