# syntax = edrevo/dockerfile-plus

# The base image
INCLUDE+ env-base/Dockerfile

# Read the requirements.txt here and install into the docker container 
# do this first so that later includes
# are forced to use the specific package versions
# specified in your requirements.txt
INCLUDE+ python/Dockerfile.fragment

# Mujoco setup
INCLUDE+ mujoco/Dockerfile.fragment

# Airsim setup
INCLUDE+ airsim/Dockerfile.fragment

# Carla setup
INCLUDE+ carla/Dockerfile.fragment
