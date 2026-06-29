#!/usr/bin/env bash
#
# docker-wipe.sh — stop and permanently remove ALL Docker containers,
# volumes, images, networks, and build cache from this system.
#
# WARNING: This is irreversible. Anything in a Docker volume (databases,
# n8n credentials/encryption key, etc.) will be permanently destroyed.
#
# Intentionally does NOT use `set -e`: a benign error on one `docker rmi`
# should not abort the rest of the cleanup.
set -uo pipefail

echo "============================================================"
echo " WARNING: This will PERMANENTLY delete every Docker:"
echo "   - container (running and stopped)"
echo "   - volume  (includes databases, n8n data, encryption keys)"
echo "   - image"
echo "   - network and build cache"
echo " on this system. This cannot be undone."
echo "============================================================"
read -rp "Type 'WIPE' to confirm: " confirm

if [[ "$confirm" != "WIPE" ]]; then
  echo "Aborted. Nothing was deleted."
  exit 0
fi

# 1. Stop all running containers (if any)
running="$(docker ps -q)"
if [[ -n "$running" ]]; then
  echo "Stopping running containers..."
  docker stop $running
fi

# 2. Remove all containers (running or stopped)
containers="$(docker ps -aq)"
if [[ -n "$containers" ]]; then
  echo "Removing containers..."
  docker rm -f $containers
fi

# 3. Remove all volumes
volumes="$(docker volume ls -q)"
if [[ -n "$volumes" ]]; then
  echo "Removing volumes..."
  docker volume rm -f $volumes
fi

# 4. Remove all images
images="$(docker images -aq)"
if [[ -n "$images" ]]; then
  echo "Removing images..."
  docker rmi -f $images
fi

# 5. Final sweep: networks, dangling resources, build cache
echo "Pruning networks and build cache..."
docker system prune -af --volumes

echo "Done. Docker has been wiped clean."
