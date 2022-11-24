if ! test -f ".env"; then
  echo "Copy .env"
  cp .env.example .env
fi

if ! test -f "php/development/.env"; then
  echo "Copy php/development/.env"
  cp php/development/.env.example php/development/.env
fi

if ! test -f "php/production/.env"; then
  echo "Copy php/production/.env"
  cp php/production/.env.example php/production/.env
fi