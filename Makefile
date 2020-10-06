build:
	docker build -t docker_syslog ./docker

publish: build
	./scripts/publish

.PHONY: build publish
