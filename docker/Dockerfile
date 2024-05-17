FROM php:7.2-fpm-stretch

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
COPY src/ /var/www/html
