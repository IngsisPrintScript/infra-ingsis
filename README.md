# infra-ingsis
Infra
# Infraestructura – Snippet Searcher

Este repo contiene **solo la infraestructura** para correr todos los servicios
de Snippet Searcher en:

- Entorno local (opcional)
- VM de desarrollo en Azure
- VM de producción en Azure

Los servicios de aplicación se ejecutan como **imágenes Docker** publicadas en
los repositorios correspondientes. **No hay código fuente** en esta VM.

## Estructura

- `docker-compose.dev.yml`: stack de desarrollo (VM dev).
- `docker-compose.prod.yml`: stack de producción (VM prod).
- `nginx/dev.conf`: configuración de NGINX + HTTPS + reverse proxy para `snippet-dev.duckdns.org`.
- `nginx/prod.conf`: idem para `snippet-prod.duckdns.org`.
- `duckdns/update-duckdns.sh`: script opcional para actualizar la IP en DuckDNS.
- `scripts/install-docker.sh`: instala Docker y Docker Compose en una VM Ubuntu.
- `scripts/deploy-dev.sh` / `scripts/deploy-prod.sh`: despliegue rápido en cada entorno.

## Pasos para levantar en una VM de Azure

1. Crear VM Ubuntu 22.04 (B1s) con puertos 22, 80 y 443 abiertos.
2. Conectarse por SSH a la VM.
3. Instalar Docker:

   ```bash
   ./scripts/install-docker.sh
   # salir y volver a entrar para aplicar el grupo docker
4. Instalar Certbot y generar certificados para el dominio DuckDNS (snippet-dev.duckdns.org o snippet-prod.duckdns.org).

Levantar el stack:

./scripts/deploy-dev.sh
# o
./scripts/deploy-prod.sh


Acceder desde el navegador:

https://snippet-dev.duckdns.org

https://snippet-prod.duckdns.org


---

## 9. Cómo encaja con el repo `azure-vm`

El repo `JuanSeZ/azure-vm` es básicamente un **Terraform** que crea una VM Ubuntu con red, IP pública y puertos abiertos. Podés:

- Usarlo tal cual para crear **vm-dev** y **vm-prod**.
- Una vez que Terraform te da las IPs, solo entrás a cada VM y seguís el README de `infra` para instalar Docker, certbot y levantar los servicios.

