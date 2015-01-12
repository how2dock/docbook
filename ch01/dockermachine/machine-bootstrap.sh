#!/bin/bash

sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install wget
sudo apt-get -y install docker.io

sudo gpasswd -a vagrant docker
sudo service docker.io restart

cd /tmp
git clone https://github.com/docker/machine.git
cd machine
script/build -os=linux

wget https://bfirsh.s3.amazonaws.com/docker/linux/docker-1.3.1-dev-identity-auth
chmod +x docker-1.3.1-dev-identity-auth
