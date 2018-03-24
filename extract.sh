#!/bin/sh
rm -rf etc
rm -f pi-car-robot.apkovl.tar
7z e pi-car-robot.apkovl.tar.gz
7z e pi-car-robot.apkovl.tar -o./etc/
rm -f pi-car-robot.apkovl.tar