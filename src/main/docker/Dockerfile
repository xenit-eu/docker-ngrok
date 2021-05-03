FROM alpine:latest

ENV NGROK_URL=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN apk add wget && wget $NGROK_URL && unzip /ngrok-stable-linux-amd64.zip -d /

FROM alpine:latest
LABEL maintainer="docker@xenit.eu"

COPY --from=0 /ngrok /usr/local/bin/ngrok
COPY entrypoint.sh /entrypoint.sh

RUN adduser -h /home/ngrok -s /sbin/nologin -D -u 990 ngrok

USER ngrok
COPY --chown="ngrok:ngrok" ngrok.yml /home/ngrok/.ngrok2/

ENTRYPOINT ["/entrypoint.sh"]