.PHONY: build run stop clean test test-local test-docker

build: clean test
	./scripts/build.sh

run:
	./scripts/run.sh

stop:
	./scripts/stop.sh

clean: stop
	./scripts/clean.sh

test-local:
	bats test/*.bats

test-docker:
	docker run --rm -v "${PWD}:/code" git-server-test test

test: test-local test-docker
