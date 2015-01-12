Starting a Snappy instance on EC2
=================================

This uses Apache libcloud

    $ sudo pip install apache-libcloud

Then you can start an instance in the European AZ with:

    $ python ./ec2snappy.py

It loads the `cloud.cfg` file as userdata.

You will need an EC2 account, an SSH key pair called `snappy` and SSH rule in your default security group.
