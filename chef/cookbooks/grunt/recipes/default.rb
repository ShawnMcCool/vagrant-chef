#
# Cookbook Name:: grunt
# Recipe:: default
#

execute "install_grunt_cli" do
  command "npm install -g grunt-cli"

  not_if { File.exists?("/usr/local/bin/grunt") }
end
