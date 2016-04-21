#!/usr/bin/env bash

# install Fabric
sudo apt-get update -q && sudo apt-get install -y \
    python-setuptools \
 && sudo easy_install pip \
 && sudo pip install \
    fabric \
    pyyaml

# add official Ansible repo & install Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -q && sudo apt-get install -y \
    software-properties-common \
    ansible

# configure hosts file for Vagrant internal network
#sudo cat >> /etc/hosts <<EOL
sudo tee -a /etc/hosts > /dev/null <<EOL

# develop nodes
10.10.1.16 mgmt
10.10.1.17 mon
10.10.1.32 web1
EOL

### VPS config
# generate SSH key and distribute it to all nodes
if [ ! -f ${HOME}/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 2048 -f ${HOME}/.ssh/id_rsa -q -N ""
fi

