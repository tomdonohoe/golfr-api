## Golfr API - golf score tracking app API

Golfr is an API to create, read, update and delete golf score tracking data.

## Installation

```bash
$ npm install
```

## Run the app

```bash
# Build Docker:
$ make build

# Watch mode within docker container:
$ make start
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
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
- mysql
- Docker

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.