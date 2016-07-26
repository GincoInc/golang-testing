.PHONY: build

all:

install:
	glide install

update:
	glide update

build:
	docker build --no-cache -t appleboy/golang-testing .

test: clean
	export PROJECT_PATH=/go/src/github.com/appleboy/golang-testing
	docker-compose -f docker/docker-compose.yml run golang-testing
	docker-compose -f docker/docker-compose.yml down

clean:
	-rm -rf .cover
