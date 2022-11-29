all: build-all push-all

build-all:
	build-nginx-development
	build-nginx-production
	build-php-development
	build-php-production

push-all:
	docker-compose push

build-mysql:
	docker-compose --env-file .env build --no-cache mysql

build-nginx-development:
	docker-compose -f nginx/docker-compose.yml  --env-file nginx/development/.env build nginx-development

build-nginx-production:
	docker-compose -f nginx/docker-compose.yml  --env-file nginx/production/.env build nginx-production

build-php-development:
	docker-compose -f php/docker-compose.yml  --env-file php/development/.env build php-development

build-php-production:
	docker-compose -f php/docker-compose.yml  --env-file php/production/.env build php-production

run-php-development:
	docker-compose -f php/docker-compose.yml  --env-file php/development/.env up php-development

run-php-production:
	docker-compose -f php/docker-compose.yml  --env-file php/production/.env up php-production

push-mysql:
	docker-compose push nginx

push-nginx-development:
	docker-compose -f nginx/docker-compose.yml  --env-file nginx/development/.env push nginx-development

push-nginx-production:
	docker-compose -f nginx/docker-compose.yml  --env-file nginx/production/.env push nginx-production

push-php-development:
	docker-compose -f php/docker-compose.yml  --env-file php/development/.env push php-development

push-php-production:
	docker-compose -f php/docker-compose.yml  --env-file php/production/.env push php-production
