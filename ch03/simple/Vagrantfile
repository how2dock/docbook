# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$bootstrap=<<SCRIPT
apt-get update
apt-get -y install wget curl
apt-get -y install bridge-utils
apt-get -y install openvswitch-common openvswitch-switch
curl -sSL https://get.docker.com | sh
#wget -qO- https://experimental.docker.com/ | sh
gpasswd -a vagrant docker
#echo DOCKER_OPTS=\\"--iptables=false --ip-forward=false --icc=false\\" >> /etc/default/docker
service docker restart
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "foobar-server" do |foobar|
    foobar.vm.box = "ubuntu/trusty64"
    foobar.vm.hostname = "foobar-server"
    #foobar.vm.network :private_network, ip: "192.168.33.10"
    foobar.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
     vb.customize ["modifyvm", :id, "--nicpromisc1", "allow-all"]
     vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    end
    foobar.vm.provision :shell, inline: $bootstrap
  end

end
