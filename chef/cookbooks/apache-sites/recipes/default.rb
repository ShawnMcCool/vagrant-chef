# Install packages
%w{ debconf vim screen mc subversion curl tmux make g++ libsqlite3-dev }.each do |a_package|
  package a_package
end

# Generate selfsigned ssl
execute "make-ssl-cert" do
  command "make-ssl-cert generate-default-snakeoil --force-overwrite"
  ignore_failure true
  action :nothing
end

# Configure sites
sites = node["sites"] ||= []

sites.each do |name|
  site = data_bag_item("sites", name)

  puts "Installing site #{site["id"]}"

  # Add site to apache config
  web_app site["host"] do
    template "sites.conf.erb"
    server_name site["host"]
    server_aliases site["aliases"]
    docroot site["docroot"]
  end

  # Add site info in /etc/hosts
  bash "hosts" do
    aliases = site["aliases"].join(' ') if site["aliases"].kind_of?(Array)
    code "echo 127.0.0.1 #{site["host"]} #{aliases} >> /etc/hosts"
  end
end

# Disable default site
apache_site "default" do
  enable false
end