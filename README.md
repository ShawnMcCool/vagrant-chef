Vagrant / Chef Configurations
============
Everything that one needs to create development environments with Vagrant and Chef.

This repo is very much a work in progress. Issues and pull-requests are encouraged.

### Features Include

- [XDebug](http://xdebug.org/) - PHP Debugging extension
- [WebGrind](https://github.com/jokkedk/webgrind) - Profiling tool
- [MailCatcher](http://mailcatcher.me/) - Easy local mail testing
- Git
- Subversion
- LAMP (including PHP 5.4)
- Sqlite
- Composer
- Curl, TMUX, screen

# Installation

These instructions are merely one way to use these tools. I'm presenting them because I feel that they're both reasonable and simple.

These are instructions for creating a development environment utilizing Vagrant for virtual-machine management and Chef for installing and configuring software.

You would install this individually into each site repo. When working on a site, you'd bring up the server. When you're done, you suspend it. I repeat. Each individual site repo has its own virtual-machine that is brought up when you're working on that specific site, and then suspended when you're done.

This should work on any Windows, OSX, or Linux box.

### Installation is two-part. First, install the applications.

- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)

- [install Vagrant](http://downloads.vagrantup.com/)

- [Install Chef Client](http://www.opscode.com/chef/install/)

### Then, set up your site repository.

- Add this repository to yours.


    $ cd mysiterepo

    $ git submodule add git@github.com:ShawnMcCool/vagrant-chef.git


- Copy an example Vagrantfile


    $ cp vagrant-chef/vagrant/vagrantfiles/Vagrantfile .


- Read the Vagrant file and uncomment / modify where appropriate

- (optional) Add this entry to hosts file


    10.10.10.10 app.local


# Working on the Application

### Start the Application


    $ vagrant up


Wait until Vagrant / Chef are done, then in your browser http://app.local/ or http://10.10.10.10

### Stop the Application

You have the choice of either... Supending the application (takes a small bit more disk space). **Recommended**


    $ vagrant suspend


or.. you can halt the box (saves like 200meg?) but requires you to start it all up again. (You don't have to rebuild the VM)


    $ vagrant halt


### Make Changes to the Environment

If configurations change you can simply run:


    $ vagrant reload


It will then apply your changes to the Vagrantfile or cookbooks.

### Running Unit-Tests


    $ vagrant ssh

    $ cd /vagrant

    $ phpunit

### How you can help!

I've made many annotations of issues in the Vagrantfile example, each could use a solution.

Trying to install this on your system and reporting back any issues that you've had with instructions listed would be a huge help.

Know a bit about Vagrant / Chef and want to complain that something could be done better? Please open an issue!

# Sources

Add list of people whose work I've stolen.
