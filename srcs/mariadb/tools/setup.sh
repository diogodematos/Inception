#!/bin/bash

#start database
service mariadb start

#To test - delete after
# DB_NAME=thedatabase
# DB_USER=theuser
# DB_PASSWORD=abc
# DB_PASS_ROOT=123

#Create database and users with passwords and permissions
mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'%' IDENTIFIED BY '$DB_PASS_ROOT';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
EOF

#restart service
service mariadb stop

#start server
exec mysqld_safe