#!/bin/bash

# Run git pull to update the repository
git fetch --all && git reset --hard origin/main
docker-compose up --build -d
