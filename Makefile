.PHONY: build test

pull:
	@docker compose pull

build:
	@docker compose build

test:
	@docker compose rm -f
	@docker compose up --exit-code-from test
