#
# Cookbook Name:: r
# Resource:: package
#
# Copyright 2012, Michael Linderman
#

actions :install, :remove

attribute :package_name, :kind_of => String, :name_attribute => true
