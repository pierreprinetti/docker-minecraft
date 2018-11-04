FROM openjdk:11-jdk

RUN apt-get -y update && apt-get -y install wget

EXPOSE 25565

RUN mkdir /minecraft && wget -q "https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar" -O /minecraft/minecraft_server.jar

WORKDIR /data
RUN echo "eula=true" > /data/eula.txt

CMD java -Xmx1024M -Xms1024M -jar /minecraft/minecraft_server.jar nogui
