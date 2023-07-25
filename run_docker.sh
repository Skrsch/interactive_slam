#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

xhost +local:root

XSOCK=/tmp/.X11-unix && \
docker run -it \
 --rm \
 -e DISPLAY=$DISPLAY \
 -v $XSOCK:$XSOCK \
 -v $1:/data/ \
 --gpus all \
 --network=host \
 --privileged \
 -e NVIDIA_DRIVER_CAPABILITIES=all \
 -e QT_X11_NO_MITSHM=1 \
 --env="XAUTHORITY=$XAUTH" \
 --volume="$XAUTH:$XAUTH" \
 --runtime=nvidia \
 interactive_slam \
 bash

 xhost -local:root

#   -v $SCRIPT_DIR/ros2bag_reader/:/src/ \
