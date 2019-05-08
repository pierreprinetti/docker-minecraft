FROM openjdk:13-alpine

RUN apk add --no-cache perl-utils

ADD https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "f1a0073671057f01aa843443fef34330281333ce  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
