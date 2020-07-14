#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  USER="1000"
else
  USER="33"
fi

# Container
bash() {
  docker-compose exec --user $USER app bash
}

root() {
  docker-compose exec --user root app bash
}

# Tools
composer() {
    docker-compose exec --user $USER app composer "$@"
}

npm() {
    docker-compose exec --user $USER app npm "$@"
}

# Laravel

artisan() {
    docker-compose exec --user $USER app php artisan "$@"
}

# Packages
phpcs() {
    docker-compose exec --user $USER app ./vendor/bin/phpcs
}

phpcbf() {
    docker-compose exec --user $USER app ./vendor/bin/phpcbf
}

"$@"
