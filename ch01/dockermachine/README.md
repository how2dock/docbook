Docker Machine
==============

This uses Vagrant to start an Ubuntu 14.04 VM in Virtual Box.
The bootstrap process downloads Machine from the GitHub repo and builds it within the Docker of the vagrant VM.
Once provisioning is finished:

    $ vagrant ssh
    $ cd /tmp/machine
    $ ./docker-1.3.1-dev-identity-auth
    $ ls ~/.docker/
    key.json  public-key.json
    $ export DIGITALOCEAN_ACCESS_TOKEN=<your access token>
    $ ./machine_linux_amd64 create -d digitalocean cookbook
    INFO[0000] Creating SSH key...                          
    INFO[0006] Creating Digital Ocean droplet...            
    INFO[0013] Waiting for SSH...                           
    INFO[0094] "cookbook" has been created and is now the active machine. To point Docker at this machine, run: export DOCKER_HOST=$(machine url) DOCKER_AUTH=identity 

Use the `ls` command to get the IP of your droplet and set the environment variables mentioned above, then you are set:

    $ ./machine_linux_amd64 ls
    NAME       ACTIVE   DRIVER         STATE     URL
    cookbook   *        digitalocean   Running   tcp://104.236.95.54:2376

    $ export DOCKER_HOST=tcp://104.236.95.54:2376 DOCKER_AUTH=identity

    $ ./docker-1.3.1-dev-identity-auth ps
    The authenticity of host "104.236.95.54:2376" can't be established.
    Remote key ID H6MC:4A3S:XYCP:BQZ5:TQUU:RMZP:FT4H:TET7:OW3S:7VVV:D33E:U3A4
    Are you sure you want to continue connecting (yes/no)? yes
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

