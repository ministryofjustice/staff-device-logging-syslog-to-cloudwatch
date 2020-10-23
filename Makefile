build:
	./scripts/build

deploy:
	./scripts/deploy

publish: build
	./scripts/publish

serve:
	docker-compose build
	docker-compose run syslog_server

test:
	./scripts/test

.PHONY: build publish deploy serve
