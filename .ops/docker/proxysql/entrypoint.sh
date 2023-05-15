#!/bin/sh

# Замените эти значения на реальные значения для вашей MySQL базы данных
MYSQL_HOST="127.0.0.1"
MYSQL_PORT="3306"
MYSQL_USER="web_news_user"
MYSQL_PASSWORD="password"
MYSQL_DB="web_news"

# Проверяем конфигурацию ProxySQL
proxysql --check-config -f /etc/proxysql.cnf
# Подготовка базы данных sysbench
sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-host=$MYSQL_HOST --mysql-port=$MYSQL_PORT --mysql-user=$MYSQL_USER --mysql-password=$MYSQL_PASSWORD --mysql-db=$MYSQL_DB --db-driver=mysql --tables=10 --table-size=1000 prepare

# Запуск ProxySQL
exec proxysql -f -c /etc/proxysql.cnf
