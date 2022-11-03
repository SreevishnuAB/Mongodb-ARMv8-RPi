FROM ubuntu:kinetic

WORKDIR /mongo

RUN set -eux; \
    groupadd --gid 999 --system mongodb; \
	useradd --uid 999 --system --gid mongodb --home-dir /data/db mongodb; \
	mkdir -p /data/db /data/configdb /data/logs; \
	chown -R mongodb:mongodb /data/db /data/configdb

RUN apt -q update && apt install -y -q curl libssl-dev 

COPY --chown=mongodb:mongodb ./bin/* .

ENV MONGO_VERSION 6.0.2

VOLUME /data/db /data/configdb /data/logs

ENV HOME /data/db

EXPOSE 27017

CMD ["./mongod", "--bind_ip_all", "--logpath /data/logs"]