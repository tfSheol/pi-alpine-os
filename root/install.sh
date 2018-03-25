#!/bin/sh
apk update
apk upgrade
apk add vim mc htop hostapd dnsmasq
rc-update add dnsmasq
rc-update add hostapd
rc-update add dnsmasq boot
rc-update add hostapd boot
scripts/init-config.sh
lbu ci

