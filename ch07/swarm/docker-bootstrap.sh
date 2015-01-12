#!/bin/bash

sudo apt-get update
sudo curl -sSL https://get.docker.com/ubuntu/ | sudo sh
sudo gpasswd -a vagrant docker
sudo echo DOCKER_OPTS=\"-H tcp://0.0.0.0:2375\" >> /etc/default/docker
sudo service docker restart
