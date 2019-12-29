FROM alpine

WORKDIR /opt/enigmatica2

RUN apk update && \
    apk add bash && \
    apk add openjdk8 && \ 
    apk add tmux && \ 
    apk add openssl && \
    apk add ca-certificates wget && \
    update-ca-certificates

EXPOSE 25565
ENTRYPOINT ["./ServerStartLinux.sh"]
