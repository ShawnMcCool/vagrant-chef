name              "varnish"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs and configures varnish"
version           "0.9.4"

recipe "varnish",      "Installs and configures varnish"
recipe "varnish::apt_repo", "Adds the official varnish project apt repository"

%w{ubuntu debian}.each do |os|
  supports os
end
