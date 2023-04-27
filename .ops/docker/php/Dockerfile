# Dockerfile для приложения на PHP

# Используем официальный образ PHP версии 8.1.2
FROM php:8.1.2-fpm

# Устанавливаем дополнительные пакеты и расширения PHP
RUN apt-get update && \
    apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \
    proxychains && \
    docker-php-ext-install pdo_mysql mysqli mbstring zip && \
    pecl install -o -f redis && \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis

# Раскомментируем строку с опцией extension=php_sockets.dll в php.ini
RUN touch /usr/local/etc/php/php.ini
RUN sed -i 's/;\(extension=php_sockets.dll\)/\1/' /usr/local/etc/php/php.ini

# Устанавливаем Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --ignore-platform-reqs
# Устанавливаем CLI Symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Устанавливаем права на директории
RUN mkdir -p /var/www/app/storage/framework/sessions \
    && mkdir -p /var/www/app/storage/framework/views \
    && mkdir -p /var/www/app/storage/framework/cache \
    && mkdir -p /var/www/app/bootstrap/cache \
    && chown -R www-data:www-data /var/www/app/storage \
    && chown -R www-data:www-data /var/www/app/bootstrap/cache
# Устанавливаем права на директории
RUN chown -R www-data:www-data /var/www/app/storage \
    && chown -R www-data:www-data /var/www/app/bootstrap/cache

# Копируем все файлы проекта в рабочую директорию контейнера
COPY --chown=www-data:www-data . /var/www/app/
COPY .ops/docker/php/proxychains.conf /etc/proxychains.conf
WORKDIR /var/www/app/
# Устанавливаем зависимости Composer и генерируем оптимизированный автозагрузчик
RUN composer install --no-interaction --prefer-dist --optimize-autoloader
# Загружаем библиотеку libproxychains.so и устанавливаем переменную окружения LD_PRELOAD
ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libproxychains.so.4

# Выполняем миграции Doctrine при запуске контейнера
CMD ["sh", "-c", "php-fpm"]

# Открываем порт для веб-сервера
EXPOSE 9000 8080