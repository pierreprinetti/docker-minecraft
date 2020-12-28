# docker-minecraft

## Running docker-minecraft

To improve security, Minecraft runs in this image as an unprivileged user (with
id 5001). In order to prepare the volume to be used by a non-root user, `chown`
must be run on the root folder of the volume.

Before you run this container, you must acknowledge the [Minecraft End User
License Agreement](https://account.mojang.com/documents/minecraft_eula). If you
agree with the terms, you must signal your decision by creating a file in the
data volume.

Here's how you can do:

```shell
podman volume create minecraft-data
podman run --rm -it -v minecraft-data:/data alpine -c 'echo "eula=true" > data/eula.txt'
podman run --rm -it -v minecraft-data:/data alpine chown -R 5001:5001 /data
podman run -d --name minecraft -p 25565:25565 -p 25565:25565/udp -v minecraft-data:/data quay.io/pierreprinetti/minecraft
```

Replace `podman` with `docker` if you prefer that.
