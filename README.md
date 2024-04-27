# Docker containers 

This repository contains some docker images which can be used to develop and production envirotments.

## Usage

All make commads are: 

````shell
$ make help

Usage: make [target] ...

General:
  build-all                          Build all containers
  push-all                           Push all containers

PHP:
  build-php-development              Build PHP development container
  build-php-production               Build PHP production container
  build-php-cli-development          Build PHP CLI development container
  build-php-cli-production           Build PHP CLI production container
  build-php-consumer-development     Build PHP Consmer development container
  build-php-consumer-production      Build PHP Consmer production container
  run-php-development                Run PHP development container
  run-php-production                 Run PHP production container
  run-php-cli-development            Run PHP CLI development container
  run-php-cli-production             Run PHP CLI production container
  run-php-consumer-development       Run PHP Consumer development container
  run-php-consumer-production        Run PHP Consumer production container
  push-php-development               Push PHP development container
  push-php-production                Push PHP production container
  push-php-cli-development           Push PHP CLI development container
  push-php-cli-production            Push PHP CLI production container
  push-php-consumer-development      Push PHP Consumer development container
  push-php-consumer-production       Push PHP Consumer production container
                                           
NGINX:
  build-nginx-development            Build NGINX development container
  build-nginx-production             Build NGINX production container
  run-nginx-development              Run NGINX development container
  run-nginx-production               Run NGINX production container
  push-nginx-development             Push NGINX development container
  push-nginx-production              Push NGINX production container

MySQL:
  build-mysql-development            Build MySQL development container
  build-mysql-production             Build MySQL production container
  run-mysql-development              Run MySQL development container
  run-mysql-production               Run MySQL production container
  push-mysql-development             Push MySQL development container
  push-mysql-production              Push MySQL production container
                                     
Node:
  build-node-development             Build Node development container
  build-node-production              Build Node production container
  run-node-development               Run Node development container
  run-node-production                Run Node production container
  push-node-development              Push Node development container
  push-node-production               Push Node production container
                                                       
Miscellaneous:
  help                               Show this help

Written by Antonio Miguel Morillo Chica, version v1.0
Please report any bug or error to the author.
````
