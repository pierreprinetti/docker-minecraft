FROM alpine

RUN adduser -DHu 5001 minecraft &&\
	mkdir -p /data &&\
	chown minecraft:minecraft /data

VOLUME ["/data"]

CMD chown -R minecraft:minecraft /data
