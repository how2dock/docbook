#!/usr/bin/env python

# This assumes an ECS cluster called foobar has been created
# This assumes a IAM instance profile called cookbook has been created
# Use ecs-policy.py to create the instance profile.

import boto
import base64

userdata="""
#!/bin/bash
echo ECS_CLUSTER=foobar >> /etc/ecs/ecs.config
"""

# Start instances with the testprofile

c = boto.connect_ec2()
#c.run_instances('ami-34ddbe5c', key_name='ecs', instance_type='t2.micro', instance_profile_name='cookbook', user_data=base64.b64encode(userdata))
c.run_instances('ami-34ddbe5c', key_name='ecs', instance_type='t2.micro', instance_profile_name='cookbook')
