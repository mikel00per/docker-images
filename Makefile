#!/usr/bin/make

SCRIPT_VERSION=v1.0
SCRIPT_AUTHOR=Antonio Miguel Morillo Chica

HELP_FUN = \
    %help; while(<>){ \
   		push@{$$help{$$2//'options'}},[$$1,$$3] \
    	if/^([\w-_]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/ \
	}; \
    print"$$_:\n", map"  $$_->[0]".(" "x(35-length($$_->[0])))."$$_->[1]\n",\
    @{$$help{$$_}},"\n" for keys %help; \

help: ##@Miscellaneous Show this help
	@echo "Usage: make [target] ...\n"
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)
	@echo "Written by $(SCRIPT_AUTHOR), version $(SCRIPT_VERSION)"
	@echo "Please report any bug or error to the author."

all: build-all push-all

build-all: ##@General Build all containers
	build-php-development
	build-php-production
	build-php-cli-development
	build-php-cli-production
	build-php-consumer-development
	build-php-consumer-production
	build-nginx-development
	build-nginx-production
	build-mysql-development
	build-mysql-production
	build-node-development
	build-node-production
	build-rabbitmq-development
	build-rabbitmq-production

push-all: ##@General Push all containers
	build-all
	push-php-development
	push-php-production
	push-php-cli-development
	push-php-cli-production
	push-php-consumer-development
	push-php-consumer-production
	push-nginx-development
	push-nginx-production
	push-mysql-development
	push-mysql-production
	push-node-development
	push-node-production
	push-rabbitmq-development
	push-rabbitmq-production

build-php-development: ##@PHP Build PHP development container
	docker compose -f php/docker-compose.yml --env-file php/development/.env build php-development

build-php-production: ##@PHP Build PHP production container
	docker compose -f php/docker-compose.yml --env-file php/production/.env build php-production

build-php-cli-development: ##@PHP Build PHP CLI development container
	docker compose -f php-cli/docker-compose.yml --env-file php-cli/development/.env build php-cli-development

build-php-cli-production: ##@PHP Build PHP CLI production container
	docker compose -f php-cli/docker-compose.yml --env-file php-cli/production/.env build php-cli-production

build-php-consumer-development: ##@PHP Build PHP Consmer development container
	docker compose -f php-consumer/docker-compose.yml --env-file php-consumer/development/.env build php-consumer-development

build-php-consumer-production: ##@PHP Build PHP Consmer production container
	docker compose -f php-consumer/docker-compose.yml --env-file php-consumer/production/.env build php-consumer-production

build-nginx-development: ##@NGINX Build NGINX development container
	docker compose -f nginx/docker-compose.yml --env-file nginx/development/.env build nginx-development

build-nginx-production: ##@NGINX Build NGINX production container
	docker compose -f nginx/docker-compose.yml --env-file nginx/production/.env build nginx-production

build-mysql-development: ##@MySQL Build MySQL development container
	docker compose -f mysql/docker-compose.yml --env-file mysql/development/.env build mysql-development

build-node-development: ##@Node Build Node development container
	docker compose -f node/docker-compose.yml --env-file node/development/.env build node-development

build-node-production: ##@Node Build Node production container
	docker compose -f node/docker-compose.yml --env-file node/production/.env build node-production

build-rabbitmq-development: ##@RabbitMq Build RabbitMq development container
	docker compose -f rabbitmq/docker-compose.yml --env-file rabbitmq/development/.env build --no-cache rabbitmq-development

build-rabbitmq-production: ##@RabbitMq Build RabbitMq production container
	docker compose -f rabbitmq/docker-compose.yml --env-file rabbitmq/production/.env build --no-cache rabbitmq-production

run-php-development: ##@PHP Run PHP development container
	docker compose -f php/docker-compose.yml --env-file php/development/.env up php-development

run-php-production: ##@PHP Run PHP production container
	docker compose -f php/docker-compose.yml --env-file php/production/.env up php-production

run-php-cli-development: ##@PHP Run PHP CLI development container
	docker compose -f php-cli/docker-compose.yml --env-file php-cli/development/.env up php-cli-development

run-php-cli-production: ##@PHP Run PHP CLI production container
	docker compose -f php-cli/docker-compose.yml --env-file php-cli/production/.env up php-cli-production

run-php-consumer-development: ##@PHP Run PHP Consumer development container
	docker compose -f php-consumer/docker-compose.yml --env-file php-consumer/development/.env up php-consumer-development

run-php-consumer-production: ##@PHP Run PHP Consumer production container
	docker compose -f php-consumer/docker-compose.yml --env-file php-consumer/production/.env up php-consumer-production

run-nginx-development: ##@NGINX Run NGINX development container
	docker compose -f nginx/docker-compose.yml --env-file nginx/development/.env up nginx-development

run-nginx-production: ##@NGINX Run NGINX production container
	docker compose -f nginx/docker-compose.yml --env-file nginx/production/.env up nginx-production

run-mysql-development: ##@MySQL Run MySQL development container
	docker compose -f mysql/docker-compose.yml --env-file mysql/development/.env up mysql-development

run-mysql-production: ##@MySQL Run MySQL production container
	docker compose -f mysql/docker-compose.yml --env-file mysql/production/.env up mysql-production

run-node-development: ##@Node Run Node development container
	docker compose -f node/docker-compose.yml --env-file node/development/.env up node-development

run-node-production: ##@Node Run Node production container
	docker compose -f node/docker-compose.yml --env-file node/production/.env up node-production

run-rabbitmq-development: ##@RabbitMq Run RabbitMq development container
	docker compose -f rabbitmq/docker-compose.yml --env-file rabbitmq/development/.env up  rabbitmq-development

run-rabbitmq-production: ##@RabbitMq Run RabbitMq production container
	docker compose -f rabbitmq/docker-compose.yml --env-file rabbitmq/production/.env up rabbitmq-production

push-php-development: ##@PHP Push PHP development container
	docker compose -f php/docker-compose.yml --env-file php/development/.env push php-development

push-php-production: ##@PHP Push PHP production container
	docker compose -f php/docker-compose.yml --env-file php/production/.env push php-production

push-php-cli-development: ##@PHP Push PHP CLI development container
	docker compose -f php-cli/docker-compose.yml --env-file php-cli/development/.env push php-cli-development

push-php-cli-production: ##@PHP Push PHP CLI production container
	docker compose -f php-cli/docker-compose.yml --env-file php-cli/production/.env push php-cli-production

push-php-consumer-development: ##@PHP Push PHP Consumer development container
	docker compose -f php-consumer/docker-compose.yml --env-file php-consumer/development/.env push php-consumer-development

push-php-consumer-production: ##@PHP Push PHP Consumer production container
	docker compose -f php-consumer/docker-compose.yml --env-file php-consumer/production/.env push php-consumer-production

push-nginx-development: ##@NGINX Push NGINX development container
	docker compose -f nginx/docker-compose.yml --env-file nginx/development/.env push nginx-development

push-nginx-production: ##@NGINX Push NGINX production container
	docker compose -f nginx/docker-compose.yml --env-file nginx/production/.env push nginx-production

push-mysql-development: ##@MySQL Push MySQL development container
	docker compose -f mysql/docker-compose.yml --env-file mysql/development/.env push mysql-development

push-mysql-production: ##@MySQL Push MySQL production container
	docker compose -f mysql/docker-compose.yml --env-file mysql/production/.env push mysql-production

push-node-development: ##@Node Push Node development container
	docker compose -f node/docker-compose.yml --env-file node/development/.env push node-development

push-node-production: ##@Node Push Node production container
	docker compose -f node/docker-compose.yml --env-file node/production/.env push node-production

push-rabbitmq-development: ##@RabbitMq Push RabbitMq development container
	docker compose -f rabbitmq/docker-compose.yml --env-file rabbitmq/development/.env push rabbitmq-development

push-rabbitmq-production: ##@RabbitMq Push RabbitMq production container
	docker compose -f rabbitmq/docker-compose.yml --env-file rabbitmq/production/.env push rabbitmq-production
