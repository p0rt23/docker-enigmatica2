FROM alpine

ENV IMAGE_NAME="enigmatica2"
WORKDIR /opt/${IMAGE_NAME}

RUN apk update && apk add openjdk8

COPY ./server.zip /opt/${IMAGE_NAME}/
COPY ./${IMAGE_NAME}/* /opt/${IMAGE_NAME}/

RUN unzip /opt/${IMAGE_NAME}/server.zip -d /opt/${IMAGE_NAME} &&\
    chmod +x /opt/${IMAGE_NAME}/*.sh 

EXPOSE 25565
ENTRYPOINT ["./entrypoint.sh"]
