#!/bin/bash

composer install --no-interaction --optimize-autoloader
supervisorctl restart
php-fpm -F -R
