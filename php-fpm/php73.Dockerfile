FROM php:7.3-fpm-alpine

ENV TZ=Asia/Shanghai

COPY pecl /tmp/pecl
COPY conf.d/* /usr/local/etc/php/conf.d/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update --no-cache bash tzdata icu-dev autoconf gcc g++ make libpng-dev \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && docker-php-ext-install intl pdo_mysql bcmath gd \
    && pecl install /tmp/pecl/redis-5.2.1.tgz \
    && pecl install /tmp/pecl/mongodb-1.7.4.tgz \
    && docker-php-ext-enable opcache redis mongodb \
    && rm -rf /var/cache/apk/* && rm -rf /tmp/*
