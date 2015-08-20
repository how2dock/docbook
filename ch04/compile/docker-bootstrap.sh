#!/bin/bash

sudo apt-get update
sudo curl -sSL https://get.docker.com/ | sudo sh
sudo gpasswd -a vagrant docker
sudo service docker restart
git clone https://github.com/docker/docker.git /tmp/docker
