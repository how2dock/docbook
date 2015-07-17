#!/usr/bin/env python

import requests
import time
from docker import Client
from docker import utils as dockerutils

c = Client(base_url="unix://var/run/docker.sock")

while True:
   res = requests.get('http://192.168.33.10/nginx_status')
   active_conn = int(res.text.split('\n')[0].split()[2])
   num_backend = len(filter(lambda c: c['Image'] == 'runseb/hostname' ,c.containers()))
 
   print num_backend, active_conn

   conn_threshold = 10

   if ( num_backend <= active_conn/conn_threshold ):
       new_backend = c.create_container(image='runseb/hostname', detach=True, ports=[5000], \
                                        host_config=dockerutils.utils.create_host_config(port_bindings={5000: None }))
       res = c.start(container=new_backend.get('Id'))
   elif ( num_backend > 1 and num_backend > active_conn/conn_threshold):
       backends = filter(lambda c: c['Image'] == 'runseb/hostname' ,c.containers())
       c.kill(container=backends[0]['Id'])
       c.remove_container(container=backends[0]['Id'])

   time.sleep(6)
