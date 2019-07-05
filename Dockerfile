FROM openjdk:13-alpine

RUN apk add --no-cache perl-utils

ADD https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "d0d0fe2b1dc6ab4c65554cb734270872b72dadd6  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
