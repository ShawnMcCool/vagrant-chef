Vagrant / Chef Configurations
============
Everything that one needs to create development environments with Vagrant and Chef.

This repo is very much a work in progress. Issues and pull-requests are encouraged.


Currently contained within are:
    - an example Vagrantfile with notes
    - all of the Chef cookbooks that you need to run a bunch of PHP stuff

# Installation

These instructions are merely one way to use these tools. I'm presenting them because I feel that they're both reasonable and simple.

Installation is two-part. First, install the applications.

- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS.

- [install Vagrant](http://downloads.vagrantup.com/)

- [Install Chef Client](http://www.opscode.com/chef/install/)

Then, set up your site repository.

- Add this repository to yours.

    $ cd mysiterepo
    $ git submodule add git@github.com:ShawnMcCool/vagrant-chef.git

- Copy an example Vagrantfile

    $ cp vagrant-chef/vagrant/vagrantfiles/Vagrantfile .

- Read the Vagrant file and uncomment / modify where appropriate

- (optional) Add this entry to hosts file

    10.10.10.10 app.local

# Running the Application

- Start up Vagrant

    $ vagrant up

- Wait until Vagrant / Chef are done, then in your browser http://app.local/ or http://10.10.10.10

# Stopping the Application

You have the choice of either... Supending the application (takes a small bit more disk space). **Recommended**

    $ vagrant suspend

or.. you can halt the box (saves like 200meg?) but requires you to start it all up again. (You don't have to rebuild the VM)

    $ vagrant halt

# Making changes to the configuration

If configurations change you can simply run:

    $ vagrant reload

It will then apply your changes to the Vagrantfile or cookbooks.


# Sources

Add list of people whose work I've stolen.