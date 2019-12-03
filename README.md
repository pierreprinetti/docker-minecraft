# docker-minecraft

## Running docker-minecraft

```shell
docker volume create minecraft-data

docker run -d -p 25565:25565 -p 25565:25565/udp -v minecraft-data:/data pierreprinetti/minecraft
```

The container will be run as an unprivileged user.

In order to use a volume created with a previous version of this image, you will have to chown the contents of the volume to uid 5001. If you use the command above to run your server (or something equivalent), you can use the `chown.Dockerfile` image in this repository:

```shell
docker build -f chown.Dockerfile -t minecraft-chown .
docker run --rm -v minecraft-data:/data minecraft-chown
```
