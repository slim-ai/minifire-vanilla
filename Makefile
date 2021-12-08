.PHONY: build test

build:
	@docker compose build

test:
	@docker compose rm -f
	@docker compose up --exit-code-from test
