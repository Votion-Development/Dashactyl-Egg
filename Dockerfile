FROM node:16-alpine

LABEL maintainer="Jamie <jamie@colournodes.com>"

RUN apk add --update --no-cache git && \
    useradd -m -d /home/container container

ENV HOME /home/container
ENV USER container
COPY ./shell/dashactyl.sh /
RUN chmod +x /dashactyl.sh
USER container

COPY ./entrypoint.sh /

CMD [ "/bin/bash", "/entrypoint.sh" ]
