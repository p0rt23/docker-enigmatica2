FROM alpine

WORKDIR /opt/enigmatica2

RUN apk update && \
    apk add bash && \
    apk add openjdk8 && \ 
    apk add curl && \ 
    apk add tmux  

EXPOSE 25565
ENTRYPOINT ["./ServerStartLinux.sh"]
