#!/usr/bin/env bash

if [ "${CHECK_ENV_SET:-}" != "YES" ]; then
    echo "ERROR: env.sh was not sourced or CHECK is incorrect!"
    exit 1
fi

docker build \
    --build-arg DOCKER_LLVM_INSTALL_PATH=${DOCKER_LLVM_INSTALL_PATH} \
    --build-arg DOCKER_WORKSPACE=${DOCKER_WORKSPACE} \
    -t mesa .
