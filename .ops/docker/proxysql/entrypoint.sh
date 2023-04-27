#!/bin/bash

# Генерируем конфигурационный файл proxysql.cnf с использованием значений окружения
#envsubst < /proxysql.cnf.tpl > /etc/proxysql.cnf

# Проверяем конфигурацию ProxySQL
proxysql --check-config -f /etc/proxysql.cnf

# Запускаем ProxySQL в переднем плане
exec proxysql -f -c /etc/proxysql.cnf
