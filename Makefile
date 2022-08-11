include .env

# up:
# ifeq ($(ENVIRONMENT), development)
# endif
# ifeq ($(ENVIRONMENT), production)
# endif

DOCKERFILE := docker-compose.yml.$(ENVIRONMENT)

# Docker commands

create-network:
	docker network create nginx-proxy

up:
	docker-compose -f ${DOCKERFILE} up -d --build --remove-orphans

stop:
	docker-compose -f ${DOCKERFILE} stop

down:
	docker-compose -f ${DOCKERFILE} down

ps:
	docker-compose -f ${DOCKERFILE} ps

logs:
	docker-compose -f ${DOCKERFILE} logs

restart:
	docker-compose -f ${DOCKERFILE} restart

php-cli:
	docker-compose -f ${DOCKERFILE} exec php sh

db-cli:
	docker-compose -f ${DOCKERFILE} exec db sh

nginx-cli:
	docker-compose -f ${DOCKERFILE} exec nginx sh

node-cli:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node sh

npm-update:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm update

npm-install:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm install

npm-ci:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm ci

npm-watch:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm run watch

npm-build:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm run build

npm-audit:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm audit

npm-audit-fix:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node npm audit fix

# Devops commands

dump-env-prod:
	docker-compose -f ${DOCKERFILE} exec composer dump-env prod

cache-clear:
	docker-compose -f ${DOCKERFILE} exec php bin/console cache:clear

cache-warm:
	docker-compose -f ${DOCKERFILE} exec php bin/console cache:warm

permissions-fix:
	docker-compose -f ${DOCKERFILE} exec php chmod -R 0777 var/cache && docker-compose exec php chmod -R 0777 var/log

after-deploy: cache-clear cache-warm permissions-fix

# Swagger commands

validate-swagger:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node swagger-cli validate swagger/v1.0/swagger.yaml

build-swagger:
	docker-compose -f ${DOCKERFILE} run --rm --no-deps node swagger-cli bundle swagger/v1.0/swagger.yaml > public/swagger/v1.0.yaml

# App commands
