FROM composer:latest
LABEL "com.vendor"="SEA Solutions" version="1.0"

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

WORKDIR /var/www/html