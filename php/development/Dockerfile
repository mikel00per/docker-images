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
      postfix \
      pcre-dev ${PHPIZE_DEPS};

# Common php
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    intl \
    zip

# Xdebug
RUN pecl install xdebug  && docker-php-ext-enable xdebug

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

ARG PHP_HEALTHCHECK_SOURCE
ARG PHP_HEALTHCHECK_TARGET
COPY ${PHP_HEALTHCHECK_SOURCE} ${PHP_HEALTHCHECK_TARGET}

ARG UID
ARG GID
ARG UNAME
ARG GNAME
RUN usermod -u ${UID} ${UNAME} && groupmod -g ${GID} ${GNAME}

# Supervisord
ARG SUPERVISORD_CONFIG_SOURCE
ARG SUPERVISORD_CONFIG_TARGET
ENV SUPERVISORD_CONFIG_SOURCE ${SUPERVISORD_CONFIG_SOURCE}
ENV SUPERVISORD_CONFIG_TARGET ${SUPERVISORD_CONFIG_TARGET}
COPY ${SUPERVISORD_CONFIG_SOURCE} ${SUPERVISORD_CONFIG_TARGET}

RUN touch /var/run/supervisor.sock
RUN chmod 777 /var/run/supervisor.sock

ARG PHP_CODE_TARGET
RUN mkdir -p ${PHP_CODE_TARGET}
RUN chown ${UNAME}:${GNAME} -R ${PHP_CODE_TARGET}
RUN chown ${UNAME}:${GNAME} -R ${SUPERVISORD_CONFIG_TARGET}
RUN chown ${UNAME}:${GNAME} -R /var/run/supervisor.sock

WORKDIR ${PHP_CODE_TARGET}

ARG PHP_ENTRYPOINT_SOURCE
ARG PHP_ENTRYPOINT_TARGET
ENV PHP_ENTRYPOINT_TARGET=$PHP_ENTRYPOINT_TARGET

COPY ${PHP_ENTRYPOINT_SOURCE} ${PHP_ENTRYPOINT_TARGET}

HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

USER www-data

CMD ["supervisord", "-c", "${SUPERVISORD_CONFIG_TARGET}"]
CMD ["supervisorctl", "-c", "${SUPERVISORD_CONFIG_TARGET}"]

ARG PHP_PORT
EXPOSE ${PHP_PORT}

ENTRYPOINT ${PHP_ENTRYPOINT_TARGET}
