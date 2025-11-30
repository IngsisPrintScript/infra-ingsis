#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Docker Engine (versión simplificada)
sudo apt install -y docker.io docker-compose

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker "$USER"

echo "Logout/Login again para usar docker sin sudo."
