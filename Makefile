.PHONY: build test pull minify run

minify:
	@docker-slim --state-path ~/.docker-slim build --compose-file docker-compose.yml --container-probe-compose-svc test --target-compose-svc database --tag nathants/webapp-vanilla:database-slim --include-new=false
	@docker-slim --state-path ~/.docker-slim build --compose-file docker-compose.yml --container-probe-compose-svc test --target-compose-svc backend  --tag nathants/webapp-vanilla:backend-slim  --include-new=false
	@docker-slim --state-path ~/.docker-slim build --compose-file docker-compose.yml --container-probe-compose-svc test --target-compose-svc frontend --tag nathants/webapp-vanilla:frontend-slim --include-new=false
	@docker compose rm -f
	@SUFFIX="-slim" docker compose up --exit-code-from test

pull:
	@docker compose pull

build:
	@docker compose build

test:
	@docker compose rm -f
	@docker compose up --exit-code-from test

run:
	@docker compose rm -f
	@docker compose up
