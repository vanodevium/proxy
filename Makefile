.DEFAULT_GOAL: help
.PHONY: help pull build up restart down run debug

help:
	@sed -rn 's/^([a-zA-Z_-]+):.*## (.*)$$/"\1" "\2"/p' < $(MAKEFILE_LIST) | xargs printf "make %-20s# %s\n"

pull: ## pull the latest traefik image
	docker-compose pull
build: ## build proxy
	docker-compose build --quiet --pull --no-cache
up: ## up proxy
	docker-compose up -d --force-recreate
restart: ## restart proxy
	docker-compose restart
down: ## stop proxy
	docker-compose down --remove-orphans
run: ## run proxy
	docker-compose up --force-recreate
debug: ## run proxy in debug mode
	docker-compose -f docker-compose.yml -f docker-compose.debug.yml up --force-recreate
