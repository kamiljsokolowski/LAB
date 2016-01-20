#!/usr/bin/env bash

# add official Ansible repo & install Ansible
apt-add-repository -y ppa:ansible/ansible
apt-get update -q && apt-get install -y \
    software-properties-common \
    ansible

# configure hosts file for Vagrant internal network
cat >> /etc/hosts <<EOL

# vagrant env nodes
10.10.32.10 mgmt
10.10.32.21  web1
EOL

