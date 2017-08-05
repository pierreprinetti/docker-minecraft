FROM openjdk:8-alpine

RUN apk add --no-cache wget

EXPOSE 25565

WORKDIR /data

RUN wget -q "https://s3.amazonaws.com/Minecraft.Download/versions/1.12.1/minecraft_server.1.12.1.jar" -O /data/minecraft_server.jar

RUN echo "eula=true" > /data/eula.txt

CMD java -Xmx1024M -Xms1024M -jar /data/minecraft_server.jar nogui
