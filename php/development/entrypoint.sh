#!/bin/bash

composer install --no-interaction --optimize-autoloader
php-fpm -F -R
