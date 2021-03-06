APP_NAME=golfr-api
DB_SERVICE=golfr-api-db
DB_HOST=golfr-api-db
DB_USER=golfr
DB_PASS=golfr
DB_NAME=golfr

###################################
# Docker
###################################

docker-build:
	docker-compose build
.PHONY: docker-build

docker-build-no-cache:
	docker-compose build --no-cache
.PHONY: docker-build-no-cache

docker-up:
	docker-compose up -d
.PHONY: docker-down

docker-up-force-build:
	docker-compose up --build -d
.PHONY: docker-up-force-build

docker-down:
	docker-compose down
.PHONY: docker-down

###################################
# Database
###################################

migrate-generate:
	@if [[ -z "$(name)" ]]; then \
		printf "\nError: Must include \'name\': ie;\n  $$ make migrate-generate name=migration-name\n\n"; \
		exit 1; \
	fi
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run migration:generate -n $(name)'
.PHONY: migrate-generate

migrate:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run migration:run'
.PHONY: migrate-generate

migrate-revert:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run migration:revert'
.PHONY: migrate-generate

create-database: 
	docker-compose exec $(DB_SERVICE) psql -U $(DB_USER) postgres -c 'create database $(DB_NAME)'
.PHONY: create-database

drop-database:
	docker-compose exec $(DB_SERVICE) psql -U $(DB_USER) postgres -c 'drop database if exists $(DB_NAME)'
.PHONY: drop-database

recreate-database: drop-database create-database
.PHONY: recreate-database

###################################
# Linting & Formatting
###################################

format:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run format:nofix'
.PHONY: format

format-fix:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run format'
.PHONY: format-fix

lint:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run lint:nofix'
.PHONY: lint

lint-fix:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run lint'
.PHONY: lint-fix

###################################
# Test
###################################

test:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run test:cov'
.PHONY: test

test-e2e:
	docker-compose run --rm --entrypoint=sh $(APP_NAME) -c 'yarn run test:e2e'
.PHONY: test
