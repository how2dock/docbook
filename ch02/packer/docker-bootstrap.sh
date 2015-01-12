#!/bin/bash

sudo apt-get update
sudo apt-get -y install docker.io
sudo apt-get -y install wget unzip
sudo wget https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
sudo unzip /home/vagrant/packer_0.7.5_linux_amd64.zip
sudo gpasswd -a vagrant docker
sudo service docker.io restart
