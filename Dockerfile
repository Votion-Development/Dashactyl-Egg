FROM node:16-alpine

LABEL maintainer="Dark <dark@zexade.com>"
LABEL maintainer="Jamie <jamie@falconhosting.co.uk>"

COPY ./entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache git && \
    adduser -D -h /home/container container && \
    chmod +x /entrypoint.sh

USER container
ENV HOME=/home/container USER=container
WORKDIR /home/container


CMD ["/bin/sh","/entrypoint.sh"]
