APP_NAME=golfr-api

build:
	docker build -t $(APP_NAME) .
.PHONY: build

start:
	docker run -p 3000:3000 --rm --entrypoint sh $(APP_NAME) -c 'npm run start:dev'
.PHONY: start
