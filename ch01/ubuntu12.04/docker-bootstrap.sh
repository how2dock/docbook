#!/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo groupadd docker
sudo gpasswd -a vagrant docker
sudo service docker.io restart
