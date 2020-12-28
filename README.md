# docker-minecraft

## Running docker-minecraft

To improve security, Minecraft runs in this image as an unprivileged user (with
id 5001). In order to prepare the volume to be used by a non-root user, `chown`
must be run on the root folder of the volume.

Here's how you can do it:

```shell
docker volume create minecraft-data
podman run --rm -it -v minecraft-data:/data alpine chown -R 5001:5001 /data
docker run -d --name minecraft -p 25565:25565 -p 25565:25565/udp -v minecraft-data:/data quay.io/pierreprinetti/minecraft
```

