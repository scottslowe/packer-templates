#!/bin/sh -x

# Create private .ssh directory for 'vagrant' user
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh

# Install Vagrant insecure public key
if [ -f /home/vagrant/authorized_keys ]; then
    mv /home/vagrant/authorized_keys /home/vagrant/.ssh/authorized_keys
    chmod 0600 /home/vagrant/.ssh/authorized_keys
fi

# Set ownership for private .ssh directory and contents
sudo chown -R vagrant:vagrant /home/vagrant.ssh

# Create /vagrant directory (for shared folders)
mkdir -p /vagrant
