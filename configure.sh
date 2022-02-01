if ! test -f ".env"; then
  echo "Copy .env"
  cp .env.example .env
fi