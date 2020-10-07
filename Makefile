build:
	docker build -t docker_syslog ./docker

deploy:
	./scripts/deploy.sh

publish: build
	./scripts/publish

test:
	docker-compose down
	docker-compose up -d --build
	./scripts/wait_for_syslog_client.sh
	curl localhost:5000
	docker-compose logs vector | grep "local testing message" 

.PHONY: build publish deploy
