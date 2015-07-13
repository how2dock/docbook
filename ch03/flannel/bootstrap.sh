#!/bin/bash

ETCD_URL=https://github.com/coreos/etcd/releases/download/v2.0.13/etcd-v2.0.13-linux-amd64.tar.gz
FLANNEL_URL=https://github.com/coreos/flannel/releases/download/v0.5.1/flannel-0.5.1-linux-amd64.tar.gz

# Install latest Docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
sudo gpasswd -a vagrant docker
sudo service docker stop

# Docker doesn't delete its bridge when stopped.
# It needs to be deleted since after flannel is running,
# it will be created with different set of options
sudo ip link del docker0

# Place for CoreOS products
sudo mkdir /opt/coreos
sudo chown vagrant:vagrant /opt/coreos

# Download and untar etcd and flannel
cd /opt/coreos
curl -L $ETCD_URL | tar xzv
curl -L $FLANNEL_URL | tar xzv
sudo chown -R vagrant:vagrant /opt/coreos
