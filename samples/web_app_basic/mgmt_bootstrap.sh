#!/usr/bin/env bash

# add official Ansible repo & install Ansible
apt-add-repository -y ppa:ansible/ansible
apt-get update -q && apt-get install -y \
    software-properties-common \
    ansible

