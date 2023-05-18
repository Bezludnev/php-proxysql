# Используем официальный образ proxysql
FROM perconalab/sysbench:latest


# Копируем файлы конфигурации
COPY .ops/docker/sysbench/runtest.sh /tmp/runtest.sh

# Даем права на исполнение
RUN chmod +x /tmp/runtest.sh

# Устанавливаем прокси-сервер ProxySQL для всех сетевых соединений
#ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libproxychains.so.4

# Запускаем скрипт entrypoint.sh
CMD ["/tmp/runtest.sh"]