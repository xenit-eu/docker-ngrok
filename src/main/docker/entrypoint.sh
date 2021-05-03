#!/bin/sh -e

if [ "$#" -ne "0" ]; then
  set -x
  exec "$@"
fi

CMD="ngrok"

# Set the protocol.
if [ -z "$NGROK_PROTOCOL" ] || [ "$NGROK_PROTOCOL" == "http" ]; then
  CMD="$CMD http"
  # default to port 80 for `http`
  NGROK_PORT="${NGROK_PORT:-80}"
else
  CMD="$CMD http"
fi

# Set the port.
if [ -z "$NGROK_PORT" ]; then
  echo "When specifying a protocol, you must also specify a NGROK_PORT to expose."
  exit 1
else
  CMD="$CMD ${NGROK_PORT}"
fi

# Set the TLS binding flag
if [ -n "$NGROK_BINDTLS" ]; then
  CMD="$CMD -bind-tls=$NGROK_BINDTLS"
fi

# Set a custom region
if [ -n "$NGROK_REGION" ]; then
  CMD="$CMD -region=$NGROK_REGION"
fi

# Override logging default
if [ -z "$NGROK_LOG" ]; then
  NGROK_LOG="stdout"
fi
CMD="$CMD --log $NGROK_LOG"

# Log format (if provided)
if [ -z "$NGROK_LOG_FORMAT" ]; then
  NGROK_LOG_FORMAT="term"
fi
CMD="$CMD --log-format $NGROK_LOG_FORMAT"

# Log level (if provided)
if [ -n "$NGROK_LOG_LEVEL" ]; then
  CMD="$CMD --log NGROK_LOG_LEVEL"
fi

set -x
exec $CMD