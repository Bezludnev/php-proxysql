FROM nginx:latest

#COPY .ops/docker/nginx/conf/default.conf /etc/nginx/conf.d/default.conf
#COPY .ops/docker/nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx  .ops/docker/nginx/configs /etc/nginx/conf.d/

RUN mkdir -p /var/www/app/public \
    && chown -R www-data:www-data /var/www/app/public \
    && chmod -R 777 /var/www/app/public
COPY . .


WORKDIR /var/www/app/
EXPOSE 8080