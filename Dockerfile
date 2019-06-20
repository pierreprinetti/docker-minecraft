FROM openjdk:13-alpine

RUN apk add --no-cache perl-utils

ADD https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar /minecraft/minecraft_server.jar
RUN [[ "$(shasum < /minecraft/minecraft_server.jar)" == "808be3869e2ca6b62378f9f4b33c946621620019  -" ]]

WORKDIR /data

RUN echo "eula=true" > ./eula.txt

EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
