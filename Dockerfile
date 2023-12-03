FROM node:16-alpine

LABEL maintainer="Dark <dark@zexade.com>"
LABEL maintainer="Jamie <jamie@falconhosting.co.uk>"

COPY ./entrypoint.sh /entrypoint.sh
COPY ./dashactyl.sh /dashactyl.sh

RUN apk add --update --no-cache git && \
    adduser -D -h /home/container container && \
    chmod +x /entrypoint.sh && \
    chmod +x /dashactyl.sh

USER container
ENV HOME=/home/container USER=container
WORKDIR /home/container


CMD ["/bin/sh","/entrypoint.sh"]
