#!/bin/bash

# Настройка параметров подключения к базе данных
DB_HOST=proxysql
DB_PORT=6033
DB_NAME=web_news
DB_USER=web_news_user
DB_PASS=password

# Подготовка теста
sysbench oltp_read_write --tables=10 --table-size=10000 --mysql-host=$DB_HOST --mysql-port=$DB_PORT --mysql-user=$DB_USER --mysql-password=$DB_PASS --mysql-db=$DB_NAME prepare

# Запуск теста
sysbench oltp_read_write --tables=10 --table-size=10000 --mysql-host=$DB_HOST --mysql-port=$DB_PORT --mysql-user=$DB_USER --mysql-password=$DB_PASS --mysql-db=$DB_NAME run > /tmp/output/readWrite.txt

# Очистка после теста
sysbench oltp_read_write --tables=10 --table-size=10000 --mysql-host=$DB_HOST --mysql-port=$DB_PORT --mysql-user=$DB_USER --mysql-password=$DB_PASS --mysql-db=$DB_NAME cleanup
