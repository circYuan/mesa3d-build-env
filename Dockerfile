FROM ubuntu:24.04

ARG DOCKER_LLVM_INSTALL_PATH="/llvm"
ARG DOCKER_WORKSPACE="/workspace"

# Build common
RUN apt update && apt upgrade -y
RUN apt install -y build-essential git ninja-build pkg-config bison flex
RUN apt install -y wget cmake python3-pip python3-venv
RUN python3 -m venv /usr/venv
ENV PATH="${DOCKER_LLVM_INSTALL_PATH}/bin:/usr/venv/bin:${PATH}"

# Build env for mesa
RUN apt install -y glslang-tools
RUN apt install -y libdrm-dev libwayland-dev libx11-xcb-dev libxext-dev libxcb-dri3-dev libxcb-present-dev libxcb-shm0-dev libxshmfence-dev libxrandr-dev
RUN pip install meson==1.9.1
RUN pip install setuptools mako pyyaml

# Build env for vk-gl-cts
RUN apt install -y vulkan-tools spirv-tools
RUN apt install -y mesa-common-dev wayland-protocols

WORKDIR ${DOCKER_WORKSPACE}
