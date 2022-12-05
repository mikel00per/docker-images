#!/usr/bin/make

SCRIPT_VERSION=v1.0
SCRIPT_AUTHOR=Antonio Miguel Morillo Chica

HELP_FUN = \
    %help; while(<>){ \
   		push@{$$help{$$2//'options'}},[$$1,$$3] \
    	if/^([\w-_]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/ \
	}; \
    print"$$_:\n", map"  $$_->[0]".(" "x(30-length($$_->[0])))."$$_->[1]\n",\
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
	build-nginx-development
	build-nginx-production
	build-mysql-development
	build-mysql-production

push-all: ##@General Push all containers
	build-all
	push-php-development
	push-php-production
	push-nginx-development
	push-nginx-production
	push-mysql-development
	push-mysql-production

build-php-development: ##@PHP Build PHP development container
	docker-compose -f php/docker-compose.yml --env-file php/development/.env build php-development

build-php-production: ##@PHP Build PHP production container
	docker-compose -f php/docker-compose.yml --env-file php/production/.env build php-production

build-nginx-development: ##@NGINX Build NGINX development container
	docker-compose -f nginx/docker-compose.yml --env-file nginx/development/.env build nginx-development

build-nginx-production: ##@NGINX Build NGINX production container
	docker-compose -f nginx/docker-compose.yml --env-file nginx/production/.env build nginx-production

build-mysql-development: ##@MySQL Build MySQL development container
	docker-compose -f mysql/docker-compose.yml --env-file mysql/development/.env build mysql-development

build-mysql-production: ##@MySQL Build MySQL production container
	docker-compose -f mysql/docker-compose.yml --env-file mysql/production/.env build mysql-production

run-php-development: ##@PHP Run PHP development container
	docker-compose -f php/docker-compose.yml --env-file php/development/.env up php-development

run-php-production: ##@PHP Run PHP production container
	docker-compose -f php/docker-compose.yml --env-file php/production/.env up php-production

run-nginx-development: ##@NGINX Run NGINX development container
	docker-compose -f nginx/docker-compose.yml --env-file nginx/development/.env up nginx-development

run-nginx-production: ##@NGINX Run NGINX production container
	docker-compose -f nginx/docker-compose.yml --env-file nginx/production/.env up nginx-production

run-mysql-development: ##@MySQL Run MySQL development container
	docker-compose -f mysql/docker-compose.yml --env-file mysql/development/.env up mysql-development

run-mysql-production: ##@MySQL Run MySQL production container
	docker-compose -f mysql/docker-compose.yml --env-file mysql/production/.env up mysql-production

push-php-development: ##@PHP Push PHP development container
	docker-compose -f php/docker-compose.yml --env-file php/development/.env push php-development

push-php-production: ##@PHP Push PHP production container
	docker-compose -f php/docker-compose.yml --env-file php/production/.env push php-production

push-nginx-development: ##@NGINX Push NGINX development container
	docker-compose -f nginx/docker-compose.yml --env-file nginx/development/.env push nginx-development

push-nginx-production: ##@NGINX Push NGINX production container
	docker-compose -f nginx/docker-compose.yml --env-file nginx/production/.env push nginx-production

push-mysql-development: ##@MySQL Push MySQL development container
	docker-compose -f mysql/docker-compose.yml --env-file mysql/development/.env push mysql-development

push-mysql-production: ##@MySQL Push MySQL production container
	docker-compose -f mysql/docker-compose.yml --env-file mysql/production/.env push mysql-production

