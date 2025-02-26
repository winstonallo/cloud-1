#!/bin/bash

if [ "$(ls -A $DB_DATADIR)" ]; then
    echo "INFO: Database system already installed in $DB_DATADIR."
else
    echo "INFO: Initializing the database system..."
    mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
fi

mysqld_safe --general-log=1 &

echo "waiting for mysql"
until mysqladmin ping --silent -u root; do
    sleep 1
done
echo "INFO: MySQL started"

echo "INFO: Checking for already initialized database.."
DB_EXISTS=$(mysql -u root -sse "SELECT 1 FROM information_schema.schemata WHERE schema_name='$DB_NAME'")
if [ ! "$DB_EXISTS" ]; then
    echo "INFO: Database not found, initializing."
    cat << EOF > /etc/mysql/init.sql
    CREATE DATABASE $DB_NAME;
    CREATE USER '$DB_ADMIN_USER'@'%' IDENTIFIED BY '$DB_ADMIN_PWD';
    GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN_USER'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';
    GRANT SELECT, INSERT, UPDATE, DELETE ON database_name.* TO '$DB_USER'@'%';
    FLUSH PRIVILEGES;
EOF
    mysql -u root < /etc/mysql/init.sql
else
    echo "INFO: Database already initialized."
fi

wait $!
