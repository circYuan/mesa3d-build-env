# Repo helps build the mesa3d and vk-gl-vts

## Run steps:
  1. Source env.sh
    - `source env.sh`
  2. Build the docker image:
    - `./build_image.sh`
  3. Run the container script to get into the docker
    - `./run_container.sh`
  4. In the container, we can run build\_mesa.sh and build\_vk\_gl\_cts.sh
    - `./build_mesa.sh` or `./build_vk_gl_cts.sh`
    - we can also set params to run\_container.sh
      `./run_container.sh ./build_mesa`
