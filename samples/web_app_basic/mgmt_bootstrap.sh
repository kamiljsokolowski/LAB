#!/usr/bin/env bash

# add official Ansible repo & install Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -q && sudo apt-get install -y \
    software-properties-common \
    ansible

# configure hosts file for Vagrant internal network
#sudo cat >> /etc/hosts <<EOL
sudo tee -a /etc/hosts > /dev/null <<EOL

# vagrant env nodes
10.10.32.10 mgmt
10.10.32.21  web1
EOL

# configure Ansible
cat >> ${HOME}/ansible.cfg <<EOL
[defaults]
hostfile=/home/vagrant/inventory.ini
EOL
cat >> ${HOME}/inventory.ini <<EOL
[web]
web1
EOL

### VPS config
# generate SSH key and distribute it to all nodes
#if [ ! -f ${HOME}/.ssh/id_rsa.pub ]; then
#    ssh-keygen -t rsa -b 2048
#fi


