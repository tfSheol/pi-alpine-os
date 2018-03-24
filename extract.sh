#!/bin/sh
rm -rf \
    etc
tar -xzf pi-car-robot.apkovl.tar.gz \
    etc/ssh \
    etc/conf.d \
    etc/network \
    etc/hostapd