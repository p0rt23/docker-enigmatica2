FROM alpine

RUN apk update && apk add openjdk8 && apk add tmux && apk add bash

EXPOSE 25565
ENTRYPOINT ["/opt/enigmatica2/ServerStartLinux.sh"]
