FROM alpine:3.6
LABEL maintainer "infiniteproject@gmail.com"

RUN addgroup -S icecast && \
    adduser -S icecast

RUN apk add --update --no-cache \
        icecast=2.4.3-r4 \
        mailcap=2.1.47-r0

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/entrypoint.sh"]
CMD icecast -c /etc/icecast.xml
