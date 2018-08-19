FROM openjdk:8-alpine

RUN apk add --no-cache wget

EXPOSE 25565

RUN mkdir /minecraft && wget -q "https://launcher.mojang.com/mc/game/1.13/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar" -O /minecraft/minecraft_server.jar

WORKDIR /data
RUN echo "eula=true" > /data/eula.txt

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
