include .env

all: build-all push-all

run:
	docker-compose --env-file .env up

build-all:
	docker-compose --env-file .env build --no-cache

push-all:
	docker-compose push

build-apache:
	docker-compose --env-file .env build --no-cache apache

build-mysql:
	docker-compose --env-file .env build --no-cache mysql

build-nginx:
	docker-compose --env-file .env build --no-cache nginx

build-php:
	docker-compose --env-file .env build --no-cache php

push-apache:
	docker-compose push apache

push-mysql:
	docker-compose push nginx

push-nginx:
	docker-compose push nginx

push-php:
	docker-compose push php