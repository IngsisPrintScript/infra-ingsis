#!/usr/bin/env bash
set -euo pipefail

# Actualiza repo
git pull --rebase

# Opcional: actualizar imágenes
docker compose -f docker-compose.dev.yml pull

# Levantar
docker compose -f docker-compose.dev.yml up -d
