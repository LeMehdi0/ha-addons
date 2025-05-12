#!/usr/bin/with-contenv bashio
TZ=$(bashio::config 'TZ')
PUID=$(bashio::config 'PUID')
PGID=$(bashio::config 'PGID')

export TZ=${TZ:-UTC}
export PUID=${PUID:-0}
export PGID=${PGID:-0}

bashio::log.info "Starting Dispatcharr..."
exec s6-setuidgid "$PUID:$PGID" \
     docker-entrypoint.sh serve --config /data/dispatcharr.yml
