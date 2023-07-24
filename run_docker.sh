#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

xhost +local:root

XSOCK=/tmp/.X11-unix && \
docker run -it \
 --rm \
 -e DISPLAY=$DISPLAY \
 -v $XSOCK:$XSOCK \
 -v $1:/data/ \
 --network=host \
 --privileged \
 interactive_slam \
 bash

 xhost -local:root

#   -v $SCRIPT_DIR/ros2bag_reader/:/src/ \
