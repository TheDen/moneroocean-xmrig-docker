# MoneroOcean xmrig docker

## Overview

Alpine docker image that compiles a static binary of `xmrig`.

* Compiles `xmrig` from [MoneroOcean's repo](https://github.com/MoneroOcean/xmrig) (pulls in the latest commit).
* Uses `gcc` as per the [office docs](https://xmrig.com/docs/miner/build/alpine) for alpine.
* Muti-stage build is used in the `Dockerfile`, so the final image is the base `alpine` image with the static `xmrig` binary.

## Building 

Run `docker-compose build run xmrig ` (or run `./build.sh` if you don't have `docker-compse`).

Also best to ensure your `alpine` base image matches your system's CPU arch, e.g., if your machine is ARM-based

```bash
$ docker inspect alpine:3 --format '{{json .Architecture}}'
"arm64"
```

Once created the image will be tagged `xmrig:latest` by default.

## Running

Edit `docker-compose.yml` with the appropriate `xmr` argumennts, then run `docker-compose run xmrig`

Or via 	`docker` with `docker run xmrig --url="gulf.moneroocean.stream:10128" --user="XMR_WALLET_ADDRESS" --rig-"id=WORKER_ID"`