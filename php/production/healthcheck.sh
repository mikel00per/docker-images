#!/bin/sh
set -e

if [ ! -f /tmp/composer_install_done ]; then
  echo "Composer install not completed"
  exit 1
fi

export SCRIPT_NAME=/ping
export SCRIPT_FILENAME=/ping
export REQUEST_METHOD=GET

if cgi-fcgi -bind -connect 127.0.0.1:9000; then
	exit 0
fi

exit 1
