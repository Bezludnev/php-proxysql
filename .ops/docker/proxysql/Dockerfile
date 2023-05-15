# Используем официальный образ proxysql
FROM proxysql/proxysql:2.3.2

# Устанавливаем gettext для работы с шаблонами
RUN apt-get update \
    && apt-get install -y default-mysql-client gettext sqlite3 libsqlite3-dev curl sysbench \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Копируем файлы конфигурации
COPY .ops/docker/proxysql/proxysql.cnf /etc/proxysql.cnf
COPY .ops/docker/proxysql/entrypoint.sh /entrypoint.sh

# Даем права на исполнение
RUN chmod +x /entrypoint.sh

# Устанавливаем прокси-сервер ProxySQL для всех сетевых соединений
#ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libproxychains.so.4

# Запускаем скрипт entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Expose порты
EXPOSE 6032 6033
