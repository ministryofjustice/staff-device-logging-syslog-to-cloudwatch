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
	docker-compose down
	docker-compose up -d --build
	./scripts/wait_for_syslog_client
	docker-compose exec -T syslog_client wget localhost:5000
	docker-compose logs syslog_server | grep "OK"

.PHONY: build publish deploy serve
