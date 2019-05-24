#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

ACCOUNT=$1
MYSQL_ROOT_PASSWORD="sample"
ACCOUNT_PASSWORD="sample"
MYSQL_DATABASE="sample_"$ACCOUNT

echo "-----------------START INSERT DATA -------------------"

cat $SCRIPT_DIR/insert_data.sql |  mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE

echo "-----------------END INSERT DATA  -------------------"

