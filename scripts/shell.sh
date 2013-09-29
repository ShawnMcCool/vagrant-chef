#!/bin/bash

if [ -n /home/vagrant/.bash_profile ]; then
    cp /vagrant/vagrant-chef/scripts/files/.bash_profile /home/vagrant
fi
