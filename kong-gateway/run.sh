#!/bin/bash

PORT=8888
KONG_PORT=8881

DB_NAME="gateway"
DB_USER="gateway"
DB_PASSWORD="@gatewaydev--"
DB_HOST="147.79.118.89"
DB_PORT=5432

echo "Starting Kong..."
docker run -d --name kong \
  -e KONG_DATABASE=postgres \
  -e KONG_PG_HOST=$DB_HOST \
  -e KONG_PG_PORT=$DB_PORT \
  -e KONG_PG_USER=$DB_USER \
  -e KONG_PG_PASSWORD=$DB_PASSWORD \
  -e KONG_PROXY_LISTEN=0.0.0.0:$PORT \
  -e KONG_ADMIN_LISTEN=0.0.0.0:$KONG_PORT \
  -p $PORT:$PORT \
  -p $KONG_PORT:$KONG_PORT \
  kong:latest

echo "Kong is running on port $PORT (proxy) and $KONG_PORT (admin)."

