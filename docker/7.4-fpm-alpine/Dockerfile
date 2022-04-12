FROM php:7.4-fpm-alpine
RUN apk add --no-cache supervisor
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd mysqli pdo_mysql zip intl bcmath soap ldap msgpack igbinary redis memcached pcov xdebug

RUN apk add --no-cache nginx yasm git mysql-client
RUN apk add certbot certbot-nginx
RUN set -eux ; \
  # download installer.php, see https://getcomposer.org/download/
  curl --silent --fail --location --retry 3 --output /tmp/installer.php --url https://raw.githubusercontent.com/composer/getcomposer.org/f24b8f860b95b52167f91bbd3e3a7bcafe043038/web/installer ; \
  # install composer phar binary
  php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=2.2.7

RUN mkdir -p /run/nginx
COPY ./docker/7.4-fpm-alpine/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html
RUN composer install --no-dev
RUN chown -R www-data: /var/www/html

COPY ./docker/7.4-fpm-alpine/startup.sh /usr/local/bin/startup.sh
COPY ./docker/7.4-fpm-alpine/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
