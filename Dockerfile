FROM node:14-bullseye-slim

LABEL maintainer="Jamie <jamie@colournodes.com>"

RUN apt-get update -y && \
    apt-get install -y ca-certificates curl wget jq git zip unzip dnsutils && \
    useradd -m -d /home/container container

ENV HOME /home/container
ENV USER container
COPY ./shell/dashactyl.sh /
RUN chmod +x /dashactyl.sh
USER container

COPY ./entrypoint.sh /

CMD [ "/bin/bash", "/entrypoint.sh" ]
