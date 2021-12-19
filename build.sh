#!/bin/bash

VERSION="latest"
BASEDIR=$(dirname "$0")
IMAGENAME="xmrig"

docker build -t ${IMAGENAME}:"${VERSION}" -f "${BASEDIR}"/Dockerfile "${BASEDIR}/../../"
