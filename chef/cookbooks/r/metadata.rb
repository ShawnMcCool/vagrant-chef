maintainer       "Michael Linderman"
maintainer_email "michael.linderman@mssm.edu"
license          "Apache 2.0"
description      "Installs/Configures R"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe           "r", "Install R base packages"

depends          "apt"
depends          "build-essential"

%w{ ubuntu centos redhat fedora }.each do |os|
  supports os
end
