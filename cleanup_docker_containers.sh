#!/bin/bash

docker-compose down --rmi all --remove-orphans || true
echo "May need to give password to remove database and migrations"
sudo rm -R ./src/data/
sudo rm .env
sudo rm -R ./src/app_backend/app_endpoint/migrations/*
sudo rm ./src/app_backend/capif_onboarding/*