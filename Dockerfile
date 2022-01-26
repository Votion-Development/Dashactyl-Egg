FROM node:16-alpine

LABEL maintainer="Jamie <jamie@colournodes.com>"

RUN apk add --update --no-cache git && \
    useradd -m -d /home/container container

ENV HOME /home/container USER container
USER container

COPY ./shell/dashactyl.sh /
COPY ./entrypoint.sh /

RUN chmod +x /dashactyl.sh
RUN chmod +x /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]
