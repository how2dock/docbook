Recipe for Docker Swarm
=======================

This starts a Vagrant cluster with a head node `swarm-head` and three compute nodes `swarm-{1-3}`

    $ vagrant up

The compute node install the latest version of docker and listen on the 0.0.0.0 interface for remote API access.
See the `docker-bootstrap.sh` script.
The head node installs the default ubuntu14.04 Docker, clones the swarm project and build a swarm image, see `swarm-bootstrap.sh`

    $ git clone https://github.com/docker/swarm.git
    $ cd swarm/
    $ docker build -t swarm .

When the cluster is up, ssh to the head node

    $ vagrant ssh swarm-head

Start a swarm container in background, mounting the `/vagrant` directory and exposing a port where you are going to run the swarm server.

    $ docker run -v /vagrant/:/tmp/vagrant -p 1234:1234 -d swarm manage --discovery file:///tmp/vagrant/swarm-cluster.cfg -H=0.0.0.0:1234

Mounting the /vagrant directory allows to share the `swarm-cluster.cfg` file, which is a hardcoded list of the compute nodes.
This is far from ideal, but the easiest discovery mechanism.

You are then ready to go with swarm:

    $ docker -H 172.17.42.1:1234 info
    Containers: 0
    Images: 0
    Storage Driver: 
    Nodes: 3
     swarm-2: http://192.168.33.12:2375
     swarm-1: http://192.168.33.11:2375
     swarm-3: http://192.168.33.13:2375
    Execution Driver: 
    Kernel Version: 
    WARNING: No memory limit support
    WARNING: No swap limit support
    WARNING: IPv4 forwarding is disabled.
    $ docker -H 172.17.42.1:1234 ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    $ docker -H 172.17.42.1:1234 run -d -p 80:80 nginx
    9bbb4950cec9d0a696e00949e536b0c79e7cf688d604043662e82f11a5ad336e
    $ docker -H 172.17.42.1:1234 ps
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                  PORTS                                   NAMES
    9bbb4950cec9        nginx:1             nginx -g 'daemon off   10 seconds ago      Up Less than a second   443/tcp, 192.168.33.13:80->80/tcp   swarm-3/prickly_poincare   
    $ docker -H 172.17.42.1:1234 run -d -p 80:80 nginx
    95d0f755d09490e0fbeab4819ba9d87ce654528cdc20f1723d601760137940de
    $ docker -H 172.17.42.1:1234 ps
    CONTAINER ID        IMAGE               COMMAND                CREATED                  STATUS                  PORTS                               NAMES
    95d0f755d094        nginx:1             nginx -g 'daemon off   Less than a second ago   Up Less than a second   443/tcp,   192.168.33.12:80->80/tcp   swarm-2/backstabbing_davinci   
    9bbb4950cec9        nginx:1             nginx -g 'daemon off   5 minutes ago            Up 5 minutes            443/tcp,   192.168.33.13:80->80/tcp   swarm-3/prickly_poincare       
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                              NAMES
    72acd5bc00de        swarm:latest        swarm manage --disco   12 minutes ago      Up 12 minutes       2375/tcp, 0.0.0.0:1234->1234/tcp   silly_brown         
    $ docker logs 72acd5bc00de
    time="2015-01-07T08:49:53Z" level=info msg="Listening for HTTP on tcp (0.0.0.0:1234)" 
    time="2015-01-07T08:50:29Z" level=info msg="GET /v1.12/info" 
    time="2015-01-07T08:50:35Z" level=info msg="GET /v1.12/containers/json" 
    time="2015-01-07T08:51:30Z" level=info msg="POST /v1.12/containers/create" 
    time="2015-01-07T08:56:09Z" level=info msg="event -> status: \"pull\" from: \"\" id: \"nginx\" node: \"swarm-3\"" 
    time="2015-01-07T08:56:09Z" level=info msg="event -> status: \"create\" from: \"nginx:1\" id:   \"9bbb4950cec9d0a696e00949e536b0c79e7cf688d604043662e82f11a5ad336e\" node: \"swarm-3\"" 
    time="2015-01-07T08:56:09Z" level=info msg="POST   /v1.12/containers/9bbb4950cec9d0a696e00949e536b0c79e7cf688d604043662e82f11a5ad336e/start" 
    time="2015-01-07T08:56:10Z" level=info msg="event -> status: \"start\" from: \"nginx:1\" id: \"9bbb4950cec9d0a696e00949e536b0c79e7cf688d604043662e82f11a5ad336e\" node: \"swarm-3\"" 
    time="2015-01-07T08:56:19Z" level=info msg="GET /v1.12/containers/json" 
    time="2015-01-07T08:56:31Z" level=info msg="POST /v1.12/containers/create" 
    time="2015-01-07T09:01:36Z" level=info msg="event -> status: \"pull\" from: \"\" id: \"nginx\" node: \"swarm-2\"" 
    time="2015-01-07T09:01:36Z" level=info msg="event -> status: \"create\" from: \"nginx:1\" id: \"95d0f755d09490e0fbeab4819ba9d87ce654528cdc20f1723d601760137940de\" node: \"swarm-2\"" 
    time="2015-01-07T09:01:36Z" level=info msg="POST /v1.12/containers/95d0f755d09490e0fbeab4819ba9d87ce654528cdc20f1723d601760137940de/start" 
    time="2015-01-07T09:01:37Z" level=info msg="event -> status: \"start\" from: \"nginx:1\" id: \"95d0f755d09490e0fbeab4819ba9d87ce654528cdc20f1723d601760137940de\" node: \"swarm-2\"" 
    time="2015-01-07T09:01:42Z" level=info msg="GET /v1.12/containers/json"