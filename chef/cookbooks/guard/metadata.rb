maintainer        "Shawn McCool, I guess..."
maintainer_email  "shawn@heybigname.com"
license           "MIT"
description       "Configures and installs Guard."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

%w{ ubuntu debian }.each do |os|
  supports os
end
