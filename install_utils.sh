#!/bin/bash

echo '--- Install Vagrant plugins'
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-disksize

pip install jmespath molecule molecule-vagrant

#create ssh key
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q