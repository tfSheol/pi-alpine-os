#!/bin/sh
rm -rf etc modules
tar xzf pi-car-robot.apkovl.tar.gz \
    etc/ssh \
    etc/conf.d \
    etc/network \
    modules