#!/bin/bash

sudo apt-get update
sudo curl -sSL https://get.docker.com/ | sudo sh
sudo gpasswd -a vagrant docker
sudo service docker restart
cd /usr/local/bin
sudo curl -LO http://cl.ly/0Q3G1l2t301S/download/docker-1.3.2-dev-linux
sudo mv docker-1.3.2-dev-linux docker 
sudo chmod +x docker
sudo service docker stop
sudo echo DOCKER=\"/usr/local/bin/docker\" >> /etc/default/docker
sudo service docker start
