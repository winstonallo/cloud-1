#!/bin/sh

# https://dev.mysql.com/doc/refman/5.7/en/mysql-install-db.html
mysql_install_db --user=wordpress --basedir=/usr --datadir=/var/lib/mysql

db_exists=$(mysql -u root -sse "select 1 from information_schema.schemata where schema_name='wordpress'")
if [ ! "$db_exists" ]; then
    echo "database not found, initializing"
    cat << eof > /etc/mysql/init.sql
    create database abied-ch;
    create user 'abied-ch'@'%' identified by 'password';
    grant all privileges on *.* to 'abied-ch'@'%' with grant option;
    flush privileges;
    create user 'wordpress'@'%' identified by 'wordpress';
    grant select, insert, update, delete on database_name.* to 'wordpress'@'%';
    flush privileges;
eof
    mysql -u root < /etc/mysql/init.sql

wait "$@"
