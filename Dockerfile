ARG VERSION=1-php8.4

#
# FRANKENPHP
#
FROM dunglas/frankenphp:${VERSION} AS base
WORKDIR /app
ENV COMPOSER_ALLOW_SUPERUSER=1

# composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# php
RUN apt update && apt upgrade -y && apt install procps --no-install-recommends -y && \
    install-php-extensions pdo_pgsql intl zip opcache pgsql redis bcmath sockets pcntl && \
    cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    echo "Europe/Amsterdam" >  /etc/timezone

