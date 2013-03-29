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

### Installation is two-part. First, install the applications.

- [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your OS.

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
    $
# Sources

Add list of people whose work I've stolen.