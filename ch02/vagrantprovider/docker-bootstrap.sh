#!/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io
sudo apt-get -y install wget
sudo wget https://releases.hashicorp.com/vagrant/1.7.2/vagrant_1.7.2_x86_64.deb
sudo dpkg -i vagrant_1.7.2_x86_64.deb
sudo gpasswd -a vagrant docker
sudo service docker.io restart
