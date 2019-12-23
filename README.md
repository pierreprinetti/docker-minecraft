# docker-minecraft

## Running docker-minecraft

```shell
docker volume create minecraft-data
docker run --rm -v minecraft-data:/data quay.io/pierreprinetti/minecraft:chown
docker run -d --name minecraft -p 25565:25565 -p 25565:25565/udp -v minecraft-data:/data quay.io/pierreprinetti/minecraft
```

The container runs as an unprivileged user. The second command will run `chown` on the target volume, then exit.
