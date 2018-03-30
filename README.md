# pi-alpine-os
## Make SD
Download lasted version of Alpine OS for Raspberry PI 
[Alpine OS Downloads](https://www.alpinelinux.org/downloads/)
* [alpine-rpi-3.7.0-armhf.tar.gz](http://dl-cdn.alpinelinux.org/alpine/v3.7/releases/armhf/alpine-rpi-3.7.0-armhf.tar.gz)

Uncompress `alpine-rpi-x.x.x-armhf.tar.gz` in SD card and copy paste `pi-car-robot.apkovl.tar.gz` and `usercfg.txt`.

Finally put SD card in a Raspberry PI and boot.

## Full install
Use a main script to do all in one step.

```
  /root/install.sh
```

## Scripts
### Config
Include `firmware`, `scripts` and `root` folder to config tracking.
```
  /scripts/init-config.sh
```

Make a persistent storage `persist.img`
```
  /scripts/persistent-storage.sh
```

### Java
Install Java Oracle `v161.12` in a persistent img `java.img`
```
  /scripts/java8-install.sh
```
