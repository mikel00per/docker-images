# Docker containers 

This repository contains some docker images which can be used to develop and production envirotments.

## Usage

All make commads are: 

````shell
$ make help

Usage: make [target] ...

Miscellaneous:
  help                          Show this help

PHP:
  build-php-development         Build PHP development container
  build-php-production          Build PHP production container
  run-php-development           Run PHP development container
  run-php-production            Run PHP production container
  push-php-development          Push PHP development container
  push-php-production           Push PHP development container

General:
  build-all                     Build all containers
  push-all                      Push all containers

NGINX:
  build-nginx-development       Build NGINX development container
  build-nginx-production        Build NGINX production container
  push-nginx-development        Push NGINX development container
  push-nginx-production         Push NGINX production container

MySQL:
  build-mysql                   Build MySQL container
  push-mysql                    Build MySQL container

Written by Antonio Miguel Morillo Chica, version v1.0
Please report any bug or error to the author.

````