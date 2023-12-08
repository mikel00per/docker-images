ARG PHP_VERSION

FROM php:${PHP_VERSION}

RUN apk update; \
    apk upgrade; \
    apk add bash fcgi shadow linux-headers;

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && apk del pcre-dev ${PHPIZE_DEPS}

RUN docker-php-ext-configure pdo_mysql && docker-php-ext-install pdo_mysql
# APCU
RUN pecl install apcu && docker-php-ext-enable apcu

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ARG PHP_CONFIG_SOURCE
ARG PHP_CONFIG_TARGET

COPY ${PHP_CONFIG_SOURCE} ${PHP_CONFIG_TARGET}

ARG PHP_FPM_CONFIG_SOURCE
ARG PHP_FPM_CONFIG_TARGET
COPY ${PHP_FPM_CONFIG_SOURCE} ${PHP_FPM_CONFIG_TARGET}

ARG PHP_HEALTHCHECK_SOURCE
ARG PHP_HEALTHCHECK_TARGET
COPY ${PHP_HEALTHCHECK_SOURCE} ${PHP_HEALTHCHECK_TARGET}

ARG UID
ARG GID
ARG UNAME
ARG GNAME
RUN usermod -u ${UID} ${UNAME} && groupmod -g ${GID} ${GNAME}

ARG PHP_CODE_TARGET
RUN mkdir -p ${PHP_CODE_TARGET}
RUN chown ${UNAME}:${GNAME} -R ${PHP_CODE_TARGET}

WORKDIR ${PHP_CODE_TARGET}

ARG PHP_ENTRYPOINT_SOURCE
ARG PHP_ENTRYPOINT_TARGET
ENV PHP_ENTRYPOINT_TARGET=$PHP_ENTRYPOINT_TARGET

COPY ${PHP_ENTRYPOINT_SOURCE} ${PHP_ENTRYPOINT_TARGET}

HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

USER www-data

ARG PHP_PORT
EXPOSE ${PHP_PORT}

ENTRYPOINT ${PHP_ENTRYPOINT_TARGET}
