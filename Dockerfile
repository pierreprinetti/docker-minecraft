FROM openjdk:14-alpine

RUN apk add --no-cache perl-utils

RUN adduser -DHu 5001 minecraft &&\
	mkdir -p /data &&\
	chown minecraft:minecraft /data

USER minecraft:minecraft

ADD --chown=minecraft:minecraft https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "f02f4473dbf152c23d7d484952121db0b36698cb  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565/tcp
EXPOSE 25565/udp

VOLUME ["/data"]

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
