Ansible Docker module
=====================

When you install Ansible it comes with a core module for managing Docker images and containers.

The `Vagrantfile` provided here will start a Ubuntu 14.04 VM with the latest Docker stable release installed and docker-py.

You can then use an ansible recipe like:

    - hosts: nginx
      tasks:
      - name: Run nginx container
      docker: image=nginx:latest detach=true ports=80:80

And start an `nginx` container by running this play.

Start the VM:

    $ vagrant up

run the play:

    $ ansible-playbook -u vagrant dock.yml

Open your browser at `http://192.168.33.10` and you will get the welcome screen of nginx

Note the defaults used for ansible in the `ansible.cfg` file:

    [defaults]
    hostfile = ./inventory
    host_key_checking = False
    private_key_file=~/.vagrant.d/insecure_private_key

If you want to use the Ansible provisioner in Vagrant you can do so:

   $ cd solo
   $ vagrant up

This will run the play automatically
