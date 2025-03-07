#!/bin/bash
set -e

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp-cli

exec /usr/local/bin/docker-entrypoint.sh apache2-foreground | sleep 10 && wp-cli core install --allow-root --url=188.245.104.21 --title=asdf --admin_user=goos --admin_password=goos --admin_email=test@test.com