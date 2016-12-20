#!/bin/sh

if [[ ! -d "/srv/symfony/var" ]]; then
	gosu symfony mkdir /srv/symfony/var
fi

if [[ -d "/srv/symfony/var/cache/" ]]; then
  rm -rf /srv/symfony/var/cache/*
fi

if [[ -d "/srv/symfony/app/cache/" ]]; then
  rm -rf /srv/symfony/app/cache/*
fi

if [[ $1 == "/bin/sh" ]]; then
  gosu symfony composer install
fi

if [[ -d "app/DoctrineMigrations/" ]] && [[ $1 == "/bin/sh" ]]; then
  gosu symfony php bin/console doctrine:migrations:migrate --no-interaction
fi

exec "$@"