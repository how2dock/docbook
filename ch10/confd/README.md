# Confd

This box sets up a Ubuntu 14.04 machine with Docker and a few images:

* progrium/consul
* gliderlabs/registrator
* nginx
* runseb/hostname

This is used to demonstract dynamic load balancing, where registrator registers containers in consul and confd automatically writes a new conf for nginx.

