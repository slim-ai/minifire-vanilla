.PHONY: build test

minify:
    @docker-slim build --compose-file docker-compose.yml --container-probe-compose-svc test --target-compose-svc database --tag webapp:database-slim
    @docker-slim build --compose-file docker-compose.yml --container-probe-compose-svc test --target-compose-svc backend --tag webapp:backend-slim
    @docker-slim build --compose-file docker-compose.yml --container-probe-compose-svc test --target-compose-svc frontend --tag webapp:frontend-slim

pull:
	@docker compose pull

build:
	@docker compose build

test:
	@docker compose rm -f
	@docker compose up --exit-code-from test
