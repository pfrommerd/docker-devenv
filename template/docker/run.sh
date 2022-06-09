#!/usr/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )"
cd $SCRIPT_DIR
mkdir -p ../.docker_home

PARENT_DIR=$(dirname $SCRIPT_DIR)
INSTANCE="main"
EXT_DEVICES=all

while [[ $# -gt 0 ]]; do
  case $1 in
    -d|--devices)
      EXT_DEVICES="$2"
      shift # past argument
      shift # past value
      ;;
    -i|--instance)
      INSTANCE="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done
PROJECT_NAME=$(basename $PARENT_DIR)_$INSTANCE

export EXT_UID=$(id -u)
export EXT_GID=$(id -g)
export EXT_USER=$USER
export EXT_DEVICES=$EXT_DEVICES

docker compose -p $PROJECT_NAME rm -f
docker compose -p $PROJECT_NAME up --build --force-recreate -d

CONTAINER_ID=$(docker compose -p $PROJECT_NAME ps -q)
docker attach $CONTAINER_ID
