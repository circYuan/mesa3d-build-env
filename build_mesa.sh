#!/usr/bin/env bash

set -x

rm -rf mesa-build
mkdir -p mesa-build
cd mesa-build && meson -D glx=xlib -D gallium-drivers=llvmpipe -D vulkan-drivers=swrast --prefix=${DOCKER_WORKSPACE}/${MESA_INSTALL_NAME} -D build-tests=true ../mesa
ninja install -j$(nproc)
