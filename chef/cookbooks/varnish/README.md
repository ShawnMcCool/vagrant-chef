Description
===========

Installs and configures varnish.

Requirements
============

## Platform:

Tested on:

* Ubuntu 11.10
* Ubuntu 10.04
* Debian 6.0

Attributes
==========

* `node['varnish']['dir']` - location of the varnish configuration
  directory
* `node['varnish']['default']` - location of the `default` file that
  controls the varnish init script on Debian/Ubuntu systems.
* `node['varnish']['version']` - If retrieving from official Varnish project
  repository, may choose 2.1 or 3.0. No effect when using default ubuntu repo. (2.1)
* `node['varnish']['start']` - Should we start varnishd at boot?  Set to "no" to disable (yes)
* `node['varnish']['nfiles']` -  Open files (131072)
* `node['varnish']['memlock']` -  Maxiumum locked memory size for shared memory log (82000)
* `node['varnish']['instance']` - Default varnish instance name (node['fqdn'])
* `node['varnish']['listen_address']` -  Default address to bind to. Blank address (the default) means all IPv4 and IPv6 interfaces, otherwise specify a host name, an IPv4 dotted quad, or an IPv6 address in brackets
* `node['varnish']['listen_port']` - Default port to listen on (6081)
* `node['varnish']['vcl_conf']` - Main configuration file. (default.vcl)
* `node['varnish']['secret_file']` - Path to a file containing a secret used for authorizing access to the management port. (/etc/varnish/secret)
* `node['varnish']['admin_listen_address']` - Telnet admin interface listen address (127.0.0.1)
* `node['varnish']['admin_listen_port']` - Telnet admin interface listen port (6082)
* `node['varnish']['user']` - Specifies the name of an unprivileged user to which the child process should switch before it starts  accepting  connections (varnish)
* `node['varnish']['group']` - Specifies  the name of an unprivileged group to which the child process should switch before it starts accepting connections (varnish)
* `node['varnish']['ttl']` - Specifies  a hard minimum time to live for cached documents. (120)
* `node['varnish']['min_threads']` - Start at least this many threads (5)
* `node['varnish']['max_threads']` - Start no more then this max amount of threads (500)
* `node['varnish']['thread_timeout']` - Thread idle timeout (300)
* `node['varnish']['storage']` - The storage type used ('file')
* `node['varnish']['storage_file']` -  Specifies either the path to the backing file or the path to a directory in which varnishd will create the backing file. Only used if using file storage. ('/var/lib/varnish/$INSTANCE/varnish_storage.bin')
* `node['varnish']['storage_size']` -  Specifies the size of the backing file or max memory allocation.  The size is assumed to be in bytes, unless followed by one of the following suffixes: K,k,M,m,G,g,T,g,% (1G)

If you don't specify your own vcl_conf file, then these attributes are used in the cookbook `default.vcl` template:

* `node['varnish']['backend_host']` = Host to serve/cache content from (localhost)
* `node['varnish']['backend_port']` = Port on backend host to access (8080)

Recipes
=======

default
-------

Installs the varnish package, manages the default varnish
configuration file, and the init script defaults file.

apt_repo
------------

If placed before the default recipe in the run list, the official
Varnish project apt repository will offer access to more version and
platform support.

Usage
=====

On systems that need a high performance caching server, use
`recipe[varnish]`. Additional configuration can be done by modifying
the `default.vcl.erb` and `ubuntu-default.erb` templates. By default
the `custom-default.erb` is set up to run with the varnish defaults, and 
a simple `default.vcl`.

License and Author
==================

Author:: Joe Williams <joe@joetify.com>

Author:: Lew Goettner <lew@goettner.net>

Contributor:: Patrick Connolly <patrick@myplanetdigital.com>

Copyright:: 2008-2009, Joe Williams

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
