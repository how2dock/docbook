Ansible Mesos Docker
=====================

The `Vagrantfile` provided here will start 3 Ubuntu 14.04 VM making a small Mesos cluster with the latest Docker stable release installed and docker-py.

Start the 3 VMs:

    $ vagrant up

run the play:

    $ ansible-playbook -u vagrant mesos.yml

Open your browser at `http://192.168.33.10:5050` and you will get the Mesos UI
Open your browser at `http://192.168.33.10:8080` and you will get the Marathon UI

To start a Docker container on one of the slaves:

    $ curl -si -H 'Content-Type: application/json' -d @docker.json 192.168.33.10:8080/v2/apps

Note the defaults used for ansible in the `ansible.cfg` file:

    [defaults]
    hostfile = ./inventory
    host_key_checking = False
    private_key_file=~/.vagrant.d/insecure_private_key
