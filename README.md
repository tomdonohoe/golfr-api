## Golfr API - golf score tracking app API

Golfr is an API to create, read, update and delete golf score tracking data.

## Installation

```bash
$ yarn install
```

## Run the app

```bash
# Build docker dev container:
$ make docker-build

# Run watch mode within docker container:
$ make docker-up
```


## Database

```bash
# generates a migration file according to entities
$ make migrate-generate name=migration-name	

# Run database migrations against the running docker postgres database
$ make migrate

# Creates a brand new database in the running docker postgres.
$ make create-database

# Drops the database in the running docker postgres database
$ make drop-database

# Drops and recreates the database in the running docker postgres database
$ make recreate-database
```

NOTE: if you get error `ERROR:  database "golfr" is being accessed by other users` you will need to disconnect your pgadmin server connection.

## Code Formatting & Linting
```bash
# checks for files that need formatting (prettier)
$ make format

# automatically fixes files that need formatting (prettier)
$ make format-fix

# checks for linting errors (eslint)
$ make lint

# automatically fixes linting errors (eslint)
$ make lint-fix
```

## Test

```bash
# unit tests with coverage report in docker
$ make test

# e2e tests in docker
$ make test-e2e

# unit tests (locally)
$ yarn run test

# run specific module (locally)
$ yarn run test ./src/module

# run specific test (locally)
$ yarn run test ./src/module/test-name.spec.ts

# e2e tests (locally)
$ yarn run test:e2e

# test coverage (locally)
$ yarn run test:cov
```

## Features

### Player (user)
- profile
- round history
- handicap

### Scoring
- per round totals (strokes + putts)

### Strokes
- track number strokes per hole
- the club used
- the distance of shot
- the direction of shot (left staight right misshit) to target

### Putting
- track number putts per hole
- track distance of each putt
- track the break of putt
- track up / down / flat slope of putt
- supporting metres, cm, yards, inches

### Penalties
- hazard
- OB
- drop

## Tech

I will use:

- NestJS (https://nestjs.com/)
- Typescript
- Typeorm (https://typeorm.io/) 
- postgres
- Docker

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.