#!/bin/bash

if [ -n /home/vagrant/.bash_profile ]; then
    cp /vagrant/vagrant-chef/scripts/files/.bash_profile /home/vagrant
    cat /vagrant/vagrant-chef/scripts/files/etc_profile >> /etc/profile
fi
