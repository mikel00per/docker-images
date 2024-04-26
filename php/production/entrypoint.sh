#!/bin/bash

cd /code || exit

if [ -f ".env.build" ]; then
    export $(grep -v '^#' .env.build | tr -d '"' | tr -d "'" | xargs -0)
fi

if [ ! -d "vendor" ]; then
    composer install --no-interaction --optimize-autoloader
fi

php-fpm -F -R
