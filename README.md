===Mongo DB ARMv8===

MongoDB versions 5 and above does not support ARMv8 architecture, which essentially means that no Raspberry Pi models can run the later versions.
This repo contains `mongod` and `mongos` binaries compiled for ARMv8 devices. Instructions for the build processes are available [here](https://www.mongodb.com/community/forums/t/add-mongodb-4-2-arm64-builds-for-raspberry-pi-os-64-bit-debian-buster/5046/9) and [here](https://github.com/mongodb/mongo/blob/master/docs/building.md)
The Docker image was built from source natively on a Raspbery Pi 4 (because cross-compiling was a huge pain), but with `mtune` value set to `Cortex-A53` - SoC of Raspberry Pi 3B+ - and can be found [here](https://hub.docker.com/r/sreevishnuab/mongo-armv8-rpi).