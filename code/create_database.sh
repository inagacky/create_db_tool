#!/bin/bash

MYSQL_APP_USER=$1
MYSQL_ROOT_PASSWORD="SAMPLE"
MYSQL_APP_USER_PASSWORD="SAMPLE"
MYSQL_DATABASE="sample_"$MYSQL_APP_USER

echo "----------------START CREATE DATABASE AND USER ---------------------------"

echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD;
echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD;
echo "CREATE USER \`$MYSQL_APP_USER\`@localhost IDENTIFIED BY '$MYSQL_APP_USER_PASSWORD'" | mysql -uroot -p$MYSQL_ROOT_PASSWORD;
echo "GRANT ALL ON *.* TO \`$MYSQL_APP_USER\`@localhost" | mysql -uroot -p$MYSQL_ROOT_PASSWORD;

# MYSQL8から認証が変わったらしく、クライアントツールから繋げなかったので上書きする
echo "ALTER USER \`$MYSQL_APP_USER\`@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_APP_USER_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD;

echo "----------------END CREATE DATABASE AND USER ---------------------------"
