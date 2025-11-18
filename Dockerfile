#dockerfile
FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    libpq-dev unzip wget \
    && docker-php-ext-install pgsql pdo pdo_pgsql

WORKDIR /var/www/html

RUN wget https://sourceforge.net/projects/mantisbt/files/mantis-stable/2.26.2/mantisbt-2.26.2.zip/download -O mantisbt.zip \
    && unzip mantisbt.zip \
    && mv mantisbt-2.26.2/* ./ \
    && rm mantisbt.zip \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
