#!/usr/bin/with-contenv bashio
# -----------------------------------------------------------------------------
# Home-Assistant bootstrap for m3u-editor
# -----------------------------------------------------------------------------

# ---------- read add-on options ----------
TZ=$(bashio::config 'TZ')
DB_CONNECTION=$(bashio::config 'DB_CONNECTION')

PG_DATABASE=$(bashio::config 'PG_DATABASE')
PG_USER=$(bashio::config 'PG_USER')
PG_PASSWORD=$(bashio::config 'PG_PASSWORD')
PG_PORT=$(bashio::config 'PG_PORT')

export TZ="${TZ:-UTC}"

# database env (only set if user filled them in)
[ -n "$DB_CONNECTION" ] && export DB_CONNECTION
[ -n "$PG_DATABASE" ]   && export PG_DATABASE DB_DATABASE="$PG_DATABASE"
[ -n "$PG_USER" ]       && export PG_USER     DB_USERNAME="$PG_USER"
[ -n "$PG_PASSWORD" ]   && export PG_PASSWORD DB_PASSWORD="$PG_PASSWORD"
[ -n "$PG_PORT" ]       && export PG_PORT     DB_PORT="$PG_PORT" DB_HOST="localhost"

# ---------- config dir bridge ----------
mkdir -p /data
mkdir -p /var/www
if [ ! -e /var/www/config ]; then
    ln -s /data /var/www/config
fi

bashio::log.info "Launching M3U-Editor (DB=$DB_CONNECTION)…"

# hand off to the upstream entrypoint (from the base image)
exec /usr/local/bin/start-container
