# tiny HA wrapper – just adds our symlink + option handling
FROM ghcr.io/lemehdi0/m3u-editor:ha

# add the HA bootstrap script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# run.sh sets up /data → /var/www/config then launches the real entrypoint
ENTRYPOINT ["/run.sh"]
