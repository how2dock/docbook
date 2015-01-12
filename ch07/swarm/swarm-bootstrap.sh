#!/bin/bash

sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install docker.io
sudo gpasswd -a vagrant docker
sudo service docker.io restart
git clone https://github.com/docker/swarm.git
cd swarm/
docker build -t swarm .
