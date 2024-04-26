#!/bin/bash

set -e

if [ -f ".env.build" ]; then
    export $(grep -v '^#' .env.build | tr -d '"' | tr -d "'" | xargs -0)
fi

if [ ! -d "vendor" ]; then
    composer install --no-interaction --optimize-autoloader
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php "$@"
fi

exec "$@"