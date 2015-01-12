#!/bin/bash

sudo yum -y update
sudo yum clean all
sudo yum -y install epel-release
sudo yum clean all
sudo yum -y install docker-io
sudo service docker start
sudo gpasswd -a vagrant docker
