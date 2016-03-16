#!/bin/sh -x

# Install sudoers config file for Vagrant
if [ -f /home/vagrant/vagrant ]; then
    mv /home/vagrant/vagrant /etc/sudoers.d/vagrant
else
    echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /home/vagrant/vagrant
    mv /home/vagrant/vagrant /etc/sudoers.d/vagrant
fi

# Set correct permissions and ownership for sudoers config file
if [ -f /etc/sudoers.d/vagrant ]; then
    chown root:root /etc/sudoers.d/vagrant
    chmod 0440 /etc/sudoers.d/vagrant
fi
