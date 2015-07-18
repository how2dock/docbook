# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$bootstrap=<<SCRIPT
apt-get update
apt-get -y install wget bridge-utils openvswitch-switch
wget -qO- https://experimental.docker.com/ | sh
service docker stop
gpasswd -a vagrant docker
ovs-vsctl add-br ovsbr-docker0
ovs-vsctl set-manager ptcp:6640
echo DOCKER_OPTS=\\"--default-network=ovs:ovsbr-docker0\\" >> /etc/default/docker
service docker restart
mkdir -p /usr/share/docker/plugins
touch /usr/share/docker/plugins/ovs.sock
wget -O /home/vagrant/docker-ovs-plugin https://github.com/gopher-net/docker-ovs-plugin/raw/master/binaries/docker-ovs-plugin-0.1-Linux-x86_64
chmod +x /home/vagrant/docker-ovs-plugin
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "ovsnode" do |ovs|
    ovs.vm.box = "ubuntu/trusty64"
    ovs.vm.hostname = "ovsnode"
    ovs.vm.network :private_network, ip: "192.168.33.10"
    ovs.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    ovs.vm.provision :shell, inline: $bootstrap
  end

end
