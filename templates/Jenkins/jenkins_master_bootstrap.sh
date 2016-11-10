#!/usr/bin/env bash

# add WebUpd8 Java repo & install Java
echo "###################"
echo "Add WebUpd8 Java repo & install Java"
sudo apt-add-repository ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true |sudo /usr/bin/debconf-set-selections
sudo apt-get update -q && sudo apt-get install -y \
    oracle-java8-installer

# add official Jenkins repo & install Jenkins
echo "###################"
echo "Add official Jenkins repo & install Jenkins"
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add - \
    && echo "deb [arch=amd64] http://pkg.jenkins.io/debian-stable binary/" |sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt-get update -q && sudo apt-get install -y \
    jenkins

