ARG PHP_VERSION

FROM php:${PHP_VERSION}

RUN apk update; \
    apk upgrade; \
    apk add bash;

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && apk del pcre-dev ${PHPIZE_DEPS}

RUN docker-php-ext-configure pdo_mysql && docker-php-ext-install pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ARG PHP_CONFIG_SOURCE
ARG PHP_CONFIG_TARGET

COPY ${PHP_CONFIG_SOURCE} ${PHP_CONFIG_TARGET}

ARG PHP_CODE_TARGET
RUN mkdir -p ${PHP_CODE_TARGET}

WORKDIR ${PHP_CODE_TARGET}

ARG PHP_ENTRYPOINT_SOURCE
ARG PHP_ENTRYPOINT_TARGET
ENV PHP_ENTRYPOINT_TARGET=$PHP_ENTRYPOINT_TARGET

COPY ${PHP_ENTRYPOINT_SOURCE} ${PHP_ENTRYPOINT_TARGET}

ENTRYPOINT ${PHP_ENTRYPOINT_TARGET}
