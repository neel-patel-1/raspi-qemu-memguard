#!/bin/bash
kernel=Image.gz
qemu-system-aarch64 \
	-machine raspi3b \
	-cpu cortex-a72 \
	-nographic  \
	-m 1G -smp 4  \
	-kernel $kernel \
	-dtb bcm2710-rpi-3-b-plus.dtb \
	-sd 2023-05-03-raspios-bullseye-arm64.img \
	-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1"  \
	-device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22
