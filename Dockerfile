FROM openjdk:16-alpine

VOLUME ["/data"]
EXPOSE 25565/tcp
EXPOSE 25565/udp

RUN apk add --no-cache perl-utils

RUN adduser -DHu 5001 minecraft

USER minecraft:minecraft

ADD --chown=minecraft:minecraft https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "35139deedbd5182953cf1caa23835da59ca3d7cd  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
