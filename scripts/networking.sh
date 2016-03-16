#!/bin/sh -x

#echo "Cleaning up udev rules..."
if [ -f /etc/udev/rules.d/70-persistent-net.rules ]; then
    rm /etc/udev/rules.d/70-persistent-net.rules
    mkdir /etc/udev/rules.d/70-persistent-net.rules
fi

if [ -d /dev/.udev ]; then
    rm -rf /dev/.udev/
fi

if [ -f /lib/udev/rules.d/75-persistent-net-generator.rules ]; then
    rm /lib/udev/rules.d/75-persistent-net-generator.rules
fi
