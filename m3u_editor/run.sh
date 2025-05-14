#!/usr/bin/with-contenv bashio
set -euo pipefail

# Link HA’s persistent volume into the app’s config directory
mkdir -p /data
rm -rf /var/www/config
ln -s /data /var/www/config

bashio::log.info "Launching M3U-Editor…"

# Drop into your fork’s entrypoint, which will then exec the real start-container
exec /ha-entrypoint.sh
