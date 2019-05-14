FROM openjdk:13-alpine

RUN apk add --no-cache perl-utils

ADD https://launcher.mojang.com/v1/objects/ed76d597a44c5266be2a7fcd77a8270f1f0bc118/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "ed76d597a44c5266be2a7fcd77a8270f1f0bc118  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
