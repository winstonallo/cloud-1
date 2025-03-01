#!/bin/sh

sleep 30

/var/www/html/wp-cli.phar core download --allow-root
/var/www/html/wp-cli.phar config create --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=mariadb --allow-root
/var/www/html/wp-cli.phar core install --url=http://13.49.225.214/ --title="cloud-1 by abied-ch" --admin_user=wordpress --admin_password=wordpress --admin_email="abied-ch@student.42vienna.com" --allow-root 

wait "$@"
