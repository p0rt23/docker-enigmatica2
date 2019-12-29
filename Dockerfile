FROM alpine

RUN apk update && apk add openjdk8 && apk add tmux

EXPOSE 25565
ENTRYPOINT ["ls /opt/enigmatica2 && /opt/enigmatica2/ServerStartLinux.sh"]
