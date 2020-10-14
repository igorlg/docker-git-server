.PHONY: build run stop clean

build: clean
	./scripts/build.sh

run:
	./scripts/run.sh

stop:
	./scripts/stop.sh

clean: stop
	./scripts/clean.sh

