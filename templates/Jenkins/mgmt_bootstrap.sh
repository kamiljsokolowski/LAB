#!/usr/bin/env bash

# configure hosts file for Vagrant internal network
echo "###################"
echo "Configure hosts file for Vagrant internal network"
#sudo cat >> /etc/hosts <<EOL
sudo tee -a /etc/hosts > /dev/null <<EOL

# develop/test nodes
10.10.0.1 mgmt
10.10.0.10 Jenkins-test-master
EOL

# generate SSH key and distribute it to all nodes
if [ ! -f ${HOME}/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 2048 -f ${HOME}/.ssh/id_rsa -q -N ""
fi

## install Fabric
#echo "###################"
#echo "Install Fabric"
#sudo apt-get update -q && sudo apt-get install -y \
#    python-setuptools \
# && sudo easy_install pip \
# && sudo pip install \
#    fabric \
#    pyyaml

# add official Ansible repo & install Ansible
echo "###################"
echo "Add official Ansible repo & install Ansible"
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -q && sudo apt-get install -y \
    software-properties-common \
    ansible


