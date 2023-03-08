if ! test -f "php/development/.env"; then
  echo "Copy php/development/.env"
  cp php/development/.env.example php/development/.env
fi

if ! test -f "php/production/.env"; then
  echo "Copy php/production/.env"
  cp php/production/.env.example php/production/.env
fi

if ! test -f "nginx/development/.env"; then
  echo "Copy nginx/development/.env"
  cp nginx/development/.env.example nginx/development/.env
fi

if ! test -f "nginx/production/.env"; then
  echo "Copy nginx/production/.env"
  cp nginx/production/.env.example nginx/production/.env
fi

if ! test -f "mysql/development/.env"; then
  echo "Copy mysql/development/.env"
  cp mysql/development/.env.example mysql/development/.env
fi

if ! test -f "mysql/production/.env"; then
  echo "Copy mysql/production/.env"
  cp mysql/production/.env.example mysql/production/.env
fi

if ! test -f "node/development/.env"; then
  echo "Copy node/development/.env"
  cp node/development/.env.example node/development/.env
fi

if ! test -f "node/production/.env"; then
  echo "Copy node/production/.env"
  cp node/production/.env.example node/production/.env
fi