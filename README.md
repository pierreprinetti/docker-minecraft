# docker-minecraft

## Running docker-minecraft

```shell
docker volume create minecraft-data

docker run -d -p 25565:25565 -p 25565:25565/udp -v minecraft-data:/data pierreprinetti/minecraft
```
