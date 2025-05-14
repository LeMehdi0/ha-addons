# Use your published, HA-friendly image (ha tag or versioned)
ARG BUILD_FROM=ghcr.io/LeMehdi0/m3u-editor:0.5.8.1
FROM ${BUILD_FROM}

# Copy in our HA wrapper
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Entrypoint will set up /data → /var/www/config and then exec the real start-container
ENTRYPOINT ["/run.sh"]
