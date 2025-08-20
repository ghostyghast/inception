#! /bin/sh

if ! wp core is-installed 2>/dev/null; then
    echo "wp not installed, downloading...."
    php -d memory_limit=512M "$(which wp)" core download --locale=en_GB
    echo "creating config..."
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOSTNAME --locale=en_GB
    wp config set WP_REDIS_HOST "redis"
    wp config set WP_REDIS_PORT "6379"
    wp config set WP_REDIS_DATABASE "0"
    echo "installing wp..."
    wp core install --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --locale=en_GB --admin_email=amaligno@student.42kl.edu.my
    echo "creating user"
    wp user create $WP_USER "$WP_USER"@mail.com --user_pass=$WP_USER_PASSWORD
    wp plugin install redis-cache
    wp plugin activate redis-cache
else
    echo "wp already installed!"
fi

php-fpm83 -F