#!/bin/sh
echo "Starting Xray..."
xray run -c /etc/xray/config.json &
XRAY_PID=$!

echo "Starting Caddy..."
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &
CADDY_PID=$!

wait $XRAY_PID $CADDY_PID
