build-health-check:
	docker build -t health_check:health_check ./docker/health_check

build:
	docker build -t latest:latest ./docker/service

deploy:
	./scripts/deploy.sh

publish: build build-health-check
	./scripts/publish health_check
	./scripts/publish latest

test:
	docker-compose down
	docker-compose up -d --build
	./scripts/wait_for_syslog_client.sh
	curl localhost:5000
	docker-compose logs vector | grep "local testing message"

.PHONY: build build-health-check publish deploy
