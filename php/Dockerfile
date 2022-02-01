ARG PHP_VERSION

FROM php:${PHP_VERSION}

RUN apk update; \
    apk upgrade; \
    apk add bash;

RUN docker-php-ext-install mysqli

ARG PHP_CONFIG_SOURCE
ARG PHP_CONFIG_TARGET

COPY ${PHP_CONFIG_SOURCE} ${PHP_CONFIG_TARGET}