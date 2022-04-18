#!/bin/bash

echo '--- Install Vagrant plugins'
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-disksize

#docker-swarm
pip install jmespath molecule

#create ssh key
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q