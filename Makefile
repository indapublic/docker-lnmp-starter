# Docker commands

create-network:
	docker network create nginx-proxy

prepare-dev:
	cp docker/nginx/app.conf.dev docker/nginx/app.conf && cp docker-compose.yml.dev docker-compose.yml

prepare-prod:
	cp docker/nginx/app.conf.prod docker/nginx/app.conf && cp docker-compose.yml.prod docker-compose.yml

up:
	docker-compose up -d --build --remove-orphans

stop:
	docker-compose stop

down:
	docker-compose down

ps:
	docker-compose ps

logs:
	docker-compose logs

restart:
	docker-compose restart

php-cli:
	docker-compose exec php sh

db-cli:
	docker-compose exec db sh

nginx-cli:
	docker-compose exec nginx sh

node-cli:
	docker-compose run --rm --no-deps node sh

npm-update:
	docker-compose run --rm --no-deps node npm update

npm-install:
	docker-compose run --rm --no-deps node npm install

npm-ci:
	docker-compose run --rm --no-deps node npm ci

npm-watch:
	docker-compose run --rm --no-deps node npm run watch

npm-build:
	docker-compose run --rm --no-deps node npm run build

npm-audit:
	docker-compose run --rm --no-deps node npm audit

npm-audit-fix:
	docker-compose run --rm --no-deps node npm audit fix

# Devops commands

dump-env-prod:
	docker-compose exec composer dump-env prod

cache-clear:
	docker-compose exec php bin/console cache:clear

cache-warm:
	docker-compose exec php bin/console cache:warm

permissions-fix:
	docker-compose exec php chmod -R 0777 var/cache && docker-compose exec php chmod -R 0777 var/log

after-deploy: cache-clear cache-warm permissions-fix

# Swagger commands

validate-swagger:
	docker-compose run --rm --no-deps node swagger-cli validate swagger/v1.0/swagger.yaml

build-swagger:
	docker-compose run --rm --no-deps node swagger-cli bundle swagger/v1.0/swagger.yaml > public/swagger/v1.0.yaml

# App commands
