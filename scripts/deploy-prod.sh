#!/usr/bin/env bash
set -euo pipefail

git pull --rebase
docker compose -f docker-compose.prod.yml pull
docker compose -f docker-compose.prod.yml up -d
