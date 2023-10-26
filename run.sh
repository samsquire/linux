#!/bin/bash
qemu-system-x86_64 -smp 4 -m 8G \
    -net nic -net user,hostfwd=tcp::10022-:22 \
    -kernel arch/x86/boot/bzImage\
    -device virtio-scsi-pci,id=scsi \
    -device scsi-hd,bus=scsi.0,drive=d0 \
    -drive file=/mount/sam/downloads/debian-12-nocloud-amd64.raw,format=raw,if=none,id=d0 \
    -append "root=/dev/sda1"
