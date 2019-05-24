#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

ACCOUNT=$1
MYSQL_ROOT_PASSWORD="sample"
ACCOUNT_PASSWORD="sample"
MYSQL_DATABASE="sample_"$ACCOUNT

echo "-----------------START CREATE TABLE -------------------"

cat $SCRIPT_DIR/create_table.sql |  mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE

echo "-----------------END CREATE TABLE -------------------"

