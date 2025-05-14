# 1) Grab your published fork
FROM ghcr.io/LeMehdi0/m3u-editor:0.5.8.1 AS m3u

# 2) Build the add-on from the official HA base
ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.3.2
FROM ${BUILD_FROM}

# Copy everything from the m3u stage
COPY --from=m3u / /

# Copy & make executable your HA wrapper
COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]
