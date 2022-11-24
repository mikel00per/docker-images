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

build-php-development:
	docker-compose -f php/docker-compose.yml  --env-file php/development/.env build php-development

build-php-production:
	docker-compose -f php/docker-compose.yml  --env-file php/production/.env build php-production

push-apache:
	docker-compose push apache

push-mysql:
	docker-compose push nginx

push-nginx:
	docker-compose push nginx

push-php-development:
	docker-compose -f php/docker-compose.yml  --env-file php/development/.env push php-development

push-php-production:
	docker-compose -f php/docker-compose.yml  --env-file php/production/.env push php-production
