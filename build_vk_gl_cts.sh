#!/usr/bin/env bash

set -x

rm -rf vk-gl-cts-build
mkdir -p vk-gl-cts-build
cd vk-gl-cts-build && cmake ../VK-GL-CTS -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_INSTALL_PREFIX=${DOCKER_WORKSPACE}/${VK_GL_CTS_NAME}
ninja install -j$(nproc)
