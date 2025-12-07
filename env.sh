#!/usr/bin/env bash

export CHECK_ENV_SET="YES"
export LLVM_INSTALL_PATH="/home/circyuan/llvm/llvm-21"
export WORKSPACE=$(pwd)
export MESA_INSTALL_NAME="mesa-install"
export TARGET="x86_64"
export TARGET_TRIPLE="${TARGET}-linux-gnu"
export VK_GL_CTS_NAME="vk-gl-cts-install"

export DOCKER_WORKSPACE="/workspace"
export DOCKER_LLVM_INSTALL_PATH="/llvm"
export DOCKER_IMAGE_NAME="mesa"
export DOCKER_IMAGE_VERSION="latest"

echo "set xhost to docker"
xhost +local:docker
