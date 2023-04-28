export VERSION ?= 1.0
DOCKERFILE = Dockerfile
DOCKER_COMPOSE = docker compose -p fogusapp

default: run
clean: clean-dev
build: build-dev
run: run-dev
restart: stop-dev run-dev
fresh: clean-dev run-dev
stop: stop-dev

stop-dev:
	@ echo "Stop all the containers"
	@ $(DOCKER_COMPOSE) down --rmi local --remove-orphans || true

clean-dev: stop-dev
	@ echo "\e[31mMay need to give password to remove database and migrations\e[0m"
	@ [ -d ./data ] && sudo rm -R ./data/ || :
	@ [ -f .env ] && sudo rm .env || :
	@ [ -d app_backend/app_endpoint/migrations ] && sudo rm -R app_backend/app_endpoint/migrations/* || :
	@ [ -d app_backend/capif_onboarding ] && sudo rm app_backend/capif_onboarding/* || :
	
build-dev: clean-dev

run-dev:
	@ cp env_to_copy.dev .env
	@ $(DOCKER_COMPOSE) up -d --build

guard-%:
        @ [ "${${*}}" = "" ] && echo "No $* detected" && exit 1 || :

.PHONY: default clean build run restart fresh