#!/usr/bin/env python
 
import random
import json
import docker
import sys

cli=docker.Client(base_url='unix://var/run/docker.sock')
 
types = ["gauge-cpu0"]
 
for h in cli.containers():
    if not h["Status"].startswith("Up"):
        continue
    stats = json.loads(cli.stats(h["Id"]).next())
    for k, v in stats.items():
        if k == "cpu_stats":
            print("PUTVAL %s/%s/%s N:%s" % (h['Names'][0].lstrip('/'), 'docker-cpu', types[0], v['cpu_usage']['total_usage']))

