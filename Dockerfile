FROM openjdk:8-alpine

RUN apk add --no-cache wget

EXPOSE 25565

RUN mkdir /minecraft && wget -q "https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar" -O /minecraft/minecraft_server.jar

WORKDIR /data
RUN echo "eula=true" > /data/eula.txt

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
