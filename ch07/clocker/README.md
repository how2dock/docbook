Clocker Recipes
===============

# Docker Vagrant Cloud

This is a Clocker blueprint for a Docker Cloud using Vagrant and VirtualBox to provision the underlying virtual machines. The blueprint will install Docker 1.5.0 and configure Weave 0.9.0 for SDN between the two hosts.

First, copy the SSH keys to your own `.ssh` directory.

```
% cp clocker_id_rsa* ~/.ssh
% chmod 600 ~/.ssh/clocker_id_rsa*
```

Start the Vagrant nodes using the `Vagrantfile` provided.

```
% vagrant up
Bringing machine 'clocker-0' up with 'virtualbox' provider...
Bringing machine 'clocker-1' up with 'virtualbox' provider...
...
```

Now, download and extract the Clocker distribution from GitHub.

```
% wget --quiet -O brooklyn-clocker-dist.tgz http://git.io/ppnt
% tar zxf brooklyn-clocker-dist.tgz
% cd brooklyn-clocker
```

Finally, start Clocker using the provided YAML file.

```
% ./bin/brooklyn.sh clocker --app ../docker-vagrant.yaml
 _                     _    _             
| |__  _ __ ___   ___ | | _| |_   _ _ __ (R)
| '_ \| '__/ _ \ / _ \| |/ / | | | | '_ \ 
| |_) | | | (_) | (_) |   <| | |_| | | | |
|_.__/|_|  \___/ \___/|_|\_\_|\__, |_| |_|
                              |___/             0.7.0-ea-cloudsoft.5
...
```

You can now connect to the Brooklyn console at http://127.0.0.1:8081/ and deploy blueprints, as described in the following recipe.

