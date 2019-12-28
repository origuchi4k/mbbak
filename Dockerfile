FROM alpine:3.11.2

LABEL maintainer "origuchi4k"
LABEL version "1.0"
LABEL description "simple mariadb backup tool"

RUN apk add --no-cache mariadb-client

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
