# Set any variables here - override them by using VARIABLE="value" in the command line
VAGRANTENV = --env=vagrant
VAGRANTSSH = vagrant ssh -c
ARTISAN = php artisan
DBNAME = default_database

# Useage information
# Use: make all
all:
	@echo "A helpful Makefile for common vagrant tasks."

	@echo "\nVagrant"
	@echo "  make up               - Start the vagrant virtual machine"
	@echo "  make clean            - Removes Laravel files in the cache, session and view storage folders."
	@echo "  make vagrant          - Sets up a vagrant box for development. This will launch the vagrant box and apply any migrations to it. Also updates composer modules, submodules and bundle assets."
	@echo "  make vagrant-clean    - Halt the VM, destroy the box, re-download and set up the box again."

	@echo "\nComposer"
	@echo "  make composer-download        - Download and install composer."
	@echo "  make composer-install         - Perform a `php composer.phar install`"
	@echo "  make composer-install-dev     - Perform a `php composer.phar install --dev`"

	@echo "\nMigrations and Database"
	@echo "  make createdb         - Create a database based on the DBNAME variable"
	@echo "  make migrate-install  - Install the laravel migration table."
	@echo "  make migrate          - Launches a migration command on your vagrantbox. Called automatically with 'make vagrant'"
	@echo "  make rollback         - Launches a rollback command on your vagrantbox."

	@echo "\nMaintenance"
	@echo "  make submodules       - Update any submodules in the project"
	@echo "  make publish          - Publish any bundle assets into /public/bundles"
	@echo "  make task             - Run a task on the vagrant box"
	@echo "  make test             - Run all unit tests on the vagrant box"

# Give help
# Use: make help
help: all

# Run almost everything from the ground up
# Update submodules, bring vagrant up, install composer, create a database, install the laravel migration table, migrate and publish assets
# Use: make vagrant
vagrant: submodules up composer-install-dev createdb migrate-install migrate publish 

# Alias to migrate-install and migrate
# Use: make vagrant-install-and-migrate
vagrant-install-and-migrate: vagrant-migrate-install vagrant-migrate

# Clean out laravel's cache, session and storage directories
# make clean
clean:
	rm storage/cache/*
	rm storage/sessions/*
	rm storage/views/*

# Update/sync submodules
# Use: make submodules
submodules:
	git submodule update --init

# Publish assets from bundles
# Use: make publish
publish:
	$(ARTISAN) bundle:publish

# Install a migration table
# Use: make migrateinstall
migrate-install:
	$(ARTISAN) migrate:install

# Bring vagrant up
# Use: make up
up:
	vagrant up

# Clean vagrant up and re-download/re-up it
# Use: make vagrant-clean
vagrant-clean:
	vagrant destroy && vagrant box remove <boxname>  && make vagrant

# Download an install composer in this project 
# Use: make composer-download
composer-download:
	$(VAGRANTSSH) "cd /vagrant && curl -sS https://getcomposer.org/installer | php"

# Perform a composer install
# Use: make composer-install
composer-install:
	$(VAGRANTSSH) "cd /vagrant && php composer.phar install"

# Perform a composer install with --dev
# Use: make composer-install-dev
composer-install-dev:
	$(VAGRANTSSH) "cd /vagrant && php composer.phar install --dev"


# Create a database
# Use: make createdb DBNAME="mydbname"
createdb:
	$(VAGRANTSSH) "mysql --user=root --password=password -e 'create database $(DBNAME)'"

# Run migrations
# Use: make migrate
migrate:
	$(VAGRANTSSH) "php /vagrant/artisan migrate $(VAGRANTENV)"

# Rollback a migration
# Use: make rollback
rollback:
	$(VAGRANTSSH) "php /vagrant/artisan migrate:rollback $(VAGRANTENV)"

# Run a specific task
# Use: make task task="mytask"
task:
	$(VAGRANTSSH) "php /vagrant/artisan $(task) $(VAGRANTENV)"

# Run unit tests through phpunit install via composer
# Use: make test
test:
	$(VAGRANTSSH) "PATH=/vagrant/vendor/phpunit/phpunit/composer/bin:$$PATH && php /vagrant/artisan test"

