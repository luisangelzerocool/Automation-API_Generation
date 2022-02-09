#!/bin/bash
# Usage: docker-install-centos.sh
# Author: Luis Angel Vanegas
# Version: 1.0

#tools for OS
sudo yum install -y yum-utils device-mapper-persistent-data lvm2  net-tools nano git

#install docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

#execute docker with one different user
sudo usermod -aG docker $USER

#execute docker with vagrant user
sudo usermod -aG docker vagrant

sudo systemctl enable docker

#install docker-compose 
#sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo docker-compose -version
#sudo setfacl -m u:1000:rw /var/run/docker.sock && echo "=> ACLs on /var/run/docker.sock OK"
