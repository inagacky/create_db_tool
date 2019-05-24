#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個の引数が必要です。" 1>&2
  exit 1
fi

echo "----------------------------------------";
echo "作成するアカウント名: $1"
echo "----------------------------------------";

echo "作成しても良いですか？ yes or no; ";

read answer

case $answer in
    "yes" | "y" | "Yes")
        echo "テストアカウントの作成処理を実施します。"
        ;;
    "no" | "n")
        echo "処理を中止します。"
        exit 0
        ;;
    *)
        echo "不明な入力です。"
        exit 0
        ;;
esac

echo "データベースの作成を行います ";

/bin/sh $SCRIPT_DIR/code/create_database.sh $1

echo "テーブルの作成を行います ";

/bin/sh $SCRIPT_DIR/code/create_table.sh $1

echo "データの作成を行います ";

/bin/sh $SCRIPT_DIR/code/insert_data.sh $1

echo "全部完了しました ";

exit 0
