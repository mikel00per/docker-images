ARG PHP_VERSION

FROM php:${PHP_VERSION}


# Common system
RUN apk update; \
    apk upgrade; \
    apk add --no-cache \
      autoconf \
      automake \
      make gcc \
      g++ \
      bash \
      icu-dev \
      libzip-dev \
      rabbitmq-c \
      rabbitmq-c-dev \
      fcgi \
      shadow \
      linux-headers \
      supervisor \
      pcre-dev ${PHPIZE_DEPS};

# Common php
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    intl \
    zip

# APCU
RUN pecl install apcu && docker-php-ext-enable apcu

# OPCache
RUN docker-php-ext-install -j$(nproc) opcache && docker-php-ext-enable opcache

# AMQP
RUN pecl install amqp && docker-php-ext-enable amqp

# MySQL
RUN docker-php-ext-configure pdo_mysql && docker-php-ext-install -j$(nproc) pdo pdo_mysql
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ARG PHP_CONFIG_SOURCE
ARG PHP_CONFIG_TARGET
COPY ${PHP_CONFIG_SOURCE} ${PHP_CONFIG_TARGET}

ARG PHP_FPM_CONFIG_SOURCE
ARG PHP_FPM_CONFIG_TARGET
COPY ${PHP_FPM_CONFIG_SOURCE} ${PHP_FPM_CONFIG_TARGET}

ARG PHP_APCU_CONFIG_SOURCE
ARG PHP_APCU_CONFIG_TARGET
COPY ${PHP_APCU_CONFIG_SOURCE} ${PHP_APCU_CONFIG_TARGET}

ARG PHP_OPCACHE_CONFIG_SOURCE
ARG PHP_OPCACHE_CONFIG_TARGET
COPY ${PHP_OPCACHE_CONFIG_SOURCE} ${PHP_OPCACHE_CONFIG_TARGET}

ARG PHP_HEALTHCHECK_SOURCE
ARG PHP_HEALTHCHECK_TARGET
COPY ${PHP_HEALTHCHECK_SOURCE} ${PHP_HEALTHCHECK_TARGET}

ARG UID
ARG GID
ARG UNAME
ARG GNAME
RUN usermod -u ${UID} ${UNAME} && groupmod -g ${GID} ${GNAME}

ARG SUPERVISORD_CONFIG_SOURCE
ARG SUPERVISORD_CONFIG_TARGET
COPY ${SUPERVISORD_CONFIG_SOURCE} ${SUPERVISORD_CONFIG_TARGET}

ARG PHP_CODE_TARGET
RUN mkdir -p ${PHP_CODE_TARGET}
RUN chown ${UNAME}:${GNAME} -R ${PHP_CODE_TARGET}
RUN chown ${UNAME}:${GNAME} -R ${SUPERVISORD_CONFIG_TARGET}

CMD ["supervisord", "-c", "${SUPERVISORD_CONFIG_TARGET}"]
CMD ["supervisorctl", "-c", "${SUPERVISORD_CONFIG_TARGET}"]

WORKDIR ${PHP_CODE_TARGET}

ARG PHP_ENTRYPOINT_SOURCE
ARG PHP_ENTRYPOINT_TARGET
ENV PHP_ENTRYPOINT_TARGET=$PHP_ENTRYPOINT_TARGET

COPY ${PHP_ENTRYPOINT_SOURCE} ${PHP_ENTRYPOINT_TARGET}

HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

ARG PHP_PORT
EXPOSE ${PHP_PORT}

ENTRYPOINT ${PHP_ENTRYPOINT_TARGET}
