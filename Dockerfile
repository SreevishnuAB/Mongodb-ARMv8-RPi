FROM ubuntu:kinetic

WORKDIR /mongo

RUN set -eux; \
    groupadd --gid 999 --system mongodb; \
	useradd --uid 999 --system --gid mongodb --home-dir /data/db mongodb; \
	mkdir -p /data/db /data/configdb; \
	chown -R mongodb:mongodb /data/db /data/configdb

RUN apt-get -q update && apt-get install -y -q curl libssl-dev 

COPY --chown=mongodb:mongodb ./bin/* /usr/local/bin

ENV MONGO_VERSION 6.0.2

VOLUME /data/db /data/configdb

ENV HOME /data/db

EXPOSE 27017

CMD ["mongod", "--bind_ip_all"]