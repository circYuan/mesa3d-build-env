#!/usr/bin/env bash

if [ "${CHECK_ENV_SET:-}" != "YES" ]; then
    echo "ERROR: env.sh was not sourced or CHECK is incorrect!"
    exit 1
fi

echo $LLVM_INSTALL_PATH
set -x

if [ $# -eq 0 ]; then
  # assume LD_LIBRARY_PATH is empty originally
  docker run -it --rm \
      -e LD_LIBRARY_PATH="${DOCKER_LLVM_INSTALL_PATH}/lib:${DOCKER_WORKSPACE}/${MESA_INSTALL_NAME}/lib/${TARGET_TRIPLE}" \
      -e VK_ICD_FILENAMES="${DOCKER_WORKSPACE}/${MESA_INSTALL_NAME}/share/vulkan/icd.d/lvp_icd.${TARGET}.json" \
      -v $WORKSPACE:$DOCKER_WORKSPACE \
      -v $LLVM_INSTALL_PATH:$DOCKER_LLVM_INSTALL_PATH \
      -e DOCKER_WORKSPACE="${DOCKER_WORKSPACE}" \
      -e MESA_INSTALL_NAME="${MESA_INSTALL_NAME}" \
      -e DISPLAY=$DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
      -v $XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR \
      ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}
else
  # assume LD_LIBRARY_PATH is empty originally
  docker run -it --rm \
      -e LD_LIBRARY_PATH="${DOCKER_LLVM_INSTALL_PATH}/lib:${DOCKER_WORKSPACE}/${MESA_INSTALL_NAME}/lib/${TARGET_TRIPLE}" \
      -e VK_ICD_FILENAMES="${DOCKER_WORKSPACE}/${MESA_INSTALL_NAME}/share/vulkan/icd.d/lvp_icd.${TARGET}.json" \
      -v $WORKSPACE:$DOCKER_WORKSPACE \
      -v $LLVM_INSTALL_PATH:$DOCKER_LLVM_INSTALL_PATH \
      -e DOCKER_WORKSPACE="${DOCKER_WORKSPACE}" \
      -e MESA_INSTALL_NAME="${MESA_INSTALL_NAME}" \
      -e DISPLAY=$DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
      -v $XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR \
      ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} \
      $@
fi
