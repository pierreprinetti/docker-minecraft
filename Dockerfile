FROM openjdk:14-alpine

RUN apk add --no-cache perl-utils

ADD https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "3dc3d84a581f14691199cf6831b71ed1296a9fdf  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565/tcp
EXPOSE 25565/udp

VOLUME ["/data"]

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
