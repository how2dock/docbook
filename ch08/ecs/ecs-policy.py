#!/usr/bin/env python

# This was created thanks to https://gist.github.com/garnaat/2917662
# Manual configuration through the AWS console is documented at:
# http://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html
# This creates a cookbook instance profle with a ecspolicy in it to use ECS preview.

import boto

policy="""{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Action": [
         "ecs:CreateCluster",
         "ecs:RegisterContainerInstance",
         "ecs:DeregisterContainerInstance",
         "ecs:DiscoverPollEndpoint",
         "ecs:Submit*",
         "ecs:Poll"
       ],
       "Resource": [
         "*"
       ]
     }
   ]
 }"""

c=boto.connect_iam()

# The try/except statements are a quick and dirty way to handle cases where elements already exists
# In cases where you run this script multiple times.

try:
    instance_profile=c.create_instance_profile('cookbook')
except:
    pass
try:
    c.create_role('ecs')
except:
    pass
try:
    c.add_role_to_instance_profile('cookbook', 'ecs')
except:
    pass
try:
    c.put_role_policy('ecs', 'ecspolicy', policy)
except:
    pass
