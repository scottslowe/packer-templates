#!/bin/sh -x

# Install Vagrant insecure public key
mkdir -p /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
mv /home/vagrant/authorized_keys /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Create /vagrant directory
mkdir -p /vagrant

# Install sudoers file for Vagrant
mv /home/vagrant/vagrant /etc/sudoers.d/vagrant
chown root:root /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
