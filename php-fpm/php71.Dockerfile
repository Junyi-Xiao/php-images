FROM php:7.1-fpm-alpine

ENV TZ=Asia/Shanghai

COPY pecl /tmp/pecl
COPY conf.d/* /usr/local/etc/php/conf.d/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update --no-cache bash tzdata icu-dev autoconf gcc g++ make libpng-dev libzip-dev sqlite-dev openssl-dev \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && docker-php-ext-install intl pdo_mysql pdo_sqlite bcmath gd pcntl zip \
    && pecl install /tmp/pecl/redis-5.3.4.tgz \
    && pecl install /tmp/pecl/mongodb-1.9.1.tgz \
    && docker-php-ext-enable opcache redis mongodb \
    && rm -rf /var/cache/apk/* && rm -rf /tmp/*
