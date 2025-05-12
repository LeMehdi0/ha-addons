ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.3.2
FROM ${BUILD_FROM}

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
