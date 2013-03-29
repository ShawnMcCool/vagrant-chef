Vagrant / Chef Configurations
============
Everything that one needs to create development environments with Vagrant and Chef.

This repo is very much a work in progress. Issues and pull-requests are encouraged.


Currently contained within are:
    - an example Vagrantfile with notes
    - all of the Chef cookbooks that you need to run a bunch of PHP stuff

# Instructions

These instructions are merely one way to use these tools. I'm presenting them because I feel that they're both reasonable and simple.

- Install Ruby / VirtualBox

Install Ruby for your OS. This is probably only needed if your run Windows. If so, use [Ruby Installer](http://rubyinstaller.org/).

[Install VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS.

- Install Vagrant / Chef

    $ gem install vagrant
    $ gem install chef

- Add this repository to yours.

    $ cd mysiterepo
    $ git submodule add git@github.com:ShawnMcCool/vagrant-chef.git

- Copy an example Vagrantfile

    $ cp vagrant-chef/vagrant/vagrantfiles/Vagrantfile .

- Read the Vagrant file and uncomment / modify where appropriate

- Start up Vagrant

    $ vagrant up

- (optional) Add this entry to hosts file

    10.10.10.10 app.local

- Wait until Vagrant / Chef are done, then in your browser http://app.local/