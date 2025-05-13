#!/usr/bin/with-contenv bashio

TZ=$(bashio::config 'TZ')
PUID=$(bashio::config 'PUID')
PGID=$(bashio::config 'PGID')

CELERY_WORKER_CONCURRENCY=$(bashio::config 'CELERY_WORKER_CONCURRENCY')
UWSGI_PROCESSES=$(bashio::config 'UWSGI_PROCESSES')
UWSGI_GEVENT=$(bashio::config 'UWSGI_GEVENT')
DISPATCHARR_SKIP_IP_LOOKUP=$(bashio::config 'DISPATCHARR_SKIP_IP_LOOKUP')

export TZ=${TZ:-UTC}
export PUID=${PUID:-0}
export PGID=${PGID:-0}

export CELERY_WORKER_CONCURRENCY
export UWSGI_PROCESSES
export UWSGI_GEVENT
export DISPATCHARR_SKIP_IP_LOOKUP

bashio::log.info "Starting Dispatcharr..."
exec s6-setuidgid "$PUID:$PGID" \
     docker-entrypoint.sh serve --config /data/dispatcharr.yml
