#!/bin/sh
tar -cvf pi-car-robot.apkovl.tar.gz -y
tar -uvf pi-car-robot.apkovl.tar \
    etc/conf.d \
    etc/network \
    etc/ssh \
    modules
rm -f pi-car-robot.apkovl.tar.gz
gzip pi-car-robot.apkovl.tar
rm -f pi-car-robot.apkovl.tar