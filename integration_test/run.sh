
set -euo pipefail
cd "$(dirname "$0")"
COMPOSE_FILE="../docker-compose.api.yaml"
BASE="http://127.0.0.1:8000"

echo "[INFO] Up"
docker compose -f "$COMPOSE_FILE" up --build -d

echo "[INFO] Waiting for API..."
for i in {1..40}; do
  if curl -fsS "$BASE/docs" >/dev/null 2>&1; then echo "[OK] ready"; break; fi
  sleep 0.5
  [[ $i -eq 40 ]] && { echo "[ERROR] not ready"; docker compose -f "$COMPOSE_FILE" logs --no-color; docker compose -f "$COMPOSE_FILE" down; exit 1; }
done

echo "[INFO] Run tests"
if pipenv run python test_docker.py; then
  docker compose -f "$COMPOSE_FILE" down
else
  docker compose -f "$COMPOSE_FILE" logs --no-color
  docker compose -f "$COMPOSE_FILE" down
  exit 1
fi