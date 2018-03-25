#!/bin/sh
apk update
apk upgrade
scripts/init-config.sh
apk add vim mc htop hostapd dnsmasq
rc-update add dnsmasq
rc-update add hostapd
rc-update add dnsmasq boot
rc-update add hostapd boot
lbu ci