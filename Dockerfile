FROM openjdk:14-alpine

RUN apk add --no-cache perl-utils

RUN adduser -DHu 5001 minecraft &&\
	mkdir -p /data &&\
	chown minecraft:minecraft /data

USER minecraft:minecraft

ADD --chown=minecraft:minecraft https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "bb2b6b1aefcd70dfd1892149ac3a215f6c636b07  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565/tcp
EXPOSE 25565/udp

VOLUME ["/data"]

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
