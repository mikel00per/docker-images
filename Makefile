include .env

all: build-all push-all

build-all: build-nginx build-php
push-all: push-nginx push-php

build-apache:
	docker-compose --env-file .env build --no-cache apache

build-mysql:
	docker-compose --env-file .env build --no-cache mysql

build-nginx:
	docker-compose --env-file .env build --no-cache nginx

build-php:
	docker-compose --env-file .env build --no-cache php

push-apache:
	docker tag containers_apache mikel00per/apache-alpine:${VERSION_TAG}
	docker push mikel00per/apache-alpine:${VERSION_TAG}

push-mysql:
	docker tag containers_mysql mikel00per/mysql-alpine:${VERSION_TAG}
	docker push mikel00per/mysql-alpine:${VERSION_TAG}

push-nginx:
	docker tag containers_nginx mikel00per/nginx-alpine:${VERSION_TAG}
	docker push mikel00per/nginx-alpine:${VERSION_TAG}

push-php:
	docker tag containers_php mikel00per/php-alpine:${VERSION_TAG}
	docker push mikel00per/php-alpine:${VERSION_TAG}


