#!/bin/bash

./client -server="$SERVER" -session-id="$SESSION_ID" -mode="$MODE" -log="$LOG" &
CLIENT_PID=$!

echo "Client PID: $CLIENT_PID"

exec gost -L "socks5+ws://${GOST_USER}:${GOST_PASS}@:${GOST_PORT}"
