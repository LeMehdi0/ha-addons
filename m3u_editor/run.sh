#!/usr/bin/with-contenv bashio
TZ=$(bashio::config 'TZ')
APP_KEY=$(bashio::config 'APP_KEY')
APP_URL=$(bashio::config 'APP_URL')
REVERB_HOST=$(bashio::config 'REVERB_HOST')
REVERB_SCHEME=$(bashio::config 'REVERB_SCHEME')

export TZ=${TZ:-UTC}
[ -n "$APP_URL" ] && export APP_URL
[ -n "$REVERB_HOST" ] && export REVERB_HOST
[ -n "$REVERB_SCHEME" ] && export REVERB_SCHEME

if [[ -z "$APP_KEY" || "$APP_KEY" == "null" ]]; then
  bashio::log.info "APP_KEY absent → génération aléatoire"
  APP_KEY=$(openssl rand -base64 32)
fi
export APP_KEY

# --- correctif persistance ---
mkdir -p /data
[ -d /var/www/config ] || ln -s /data /var/www/config
# -----------------------------

bashio::log.info "Launching M3U-Editor..."
exec docker-entrypoint.sh
