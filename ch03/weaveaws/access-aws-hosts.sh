#!/bin/bash
#

DIRNAME=`dirname $0`
CURL=curl

if [ $DIRNAME = "." ]; then
    DIRNAME=`pwd`
fi 

ANSIBLE_INVENTORY=${ANSIBLE_INVENTORY:-$DIRNAME/inventory}

if [ ! -f $ANSIBLE_INVENTORY ]; then
    echo "No Ansible inventory file found, exiting"
    exit 1
fi

# we our public ip address

AWS_PUBLIC_IP=$(grep public_ip $ANSIBLE_INVENTORY | cut -d "=" -f2)

type -P "$CURL" >/dev/null 2>&1 && echo "Connecting to HAProxy with Weave on AWS demo" || { echo "curl not found, exiting"; exit 1; }

for i in `seq 1 6`
do
    curl $AWS_PUBLIC_IP
done
