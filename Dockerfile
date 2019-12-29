FROM alpine

ENV IMAGE_NAME="enigmatica2"
WORKDIR /opt/${IMAGE_NAME}

RUN apk update && apk add openjdk8 && apk add tmux

EXPOSE 25565
ENTRYPOINT ["./ServerStartLinux.sh"]
