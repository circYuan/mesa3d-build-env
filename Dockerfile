FROM ubuntu:24.04
ENV PATH="/usr/llvm/llvm-21/bin:/usr/venv/bin:${PATH}"
RUN apt update && apt upgrade -y
RUN apt install -y build-essential git ninja-build pkg-config bison flex
RUN apt install -y wget cmake python3-pip python3-venv
RUN apt install -y glslang-tools
RUN apt install -y libdrm-dev libwayland-dev libx11-xcb-dev libxext-dev libxcb-dri3-dev libxcb-present-dev libxcb-shm0-dev libxshmfence-dev libxrandr-dev
RUN python3 -m venv /usr/venv
RUN pip install meson==1.9.1
RUN pip install setuptools mako pyyaml

ENV LD_LIBRARY_PATH="/usr/my_project/mesa-install/lib/x86_64-linux-gnu:/usr/llvm/llvm-21/lib"
ENV VK_ICD_FILENAMES="/usr/my_project/mesa-install/share/vulkan/icd.d/lvp_icd.x86_64.json"

# Build for vk-gl-cts
RUN apt install -y vulkan-tools spirv-tools
Run apt install -y mesa-common-dev wayland-protocols

WORKDIR /usr/my_project
