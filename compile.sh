#!/bin/sh
gunzip pi-car-robot.apkovl.tar.gz
7z u pi-car-robot.apkovl.tar \
    etc \
    lib \
    scripts \
    root \
    media
gzip pi-car-robot.apkovl.tar