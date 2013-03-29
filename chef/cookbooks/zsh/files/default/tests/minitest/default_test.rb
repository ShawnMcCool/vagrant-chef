#
# Cookbook:: zsh
# Minitest Chef Handler
#
# Author:: Joshua Timberman <joshua@opscode.com>
# Copyright:: Copyright (c) 2012, Opscode, Inc. <legal@opscode.com>
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require File.expand_path('../support/helpers', __FILE__)

describe 'zsh::default' do
  include Helpers::Zsh

  it 'installs zsh' do
    package("zsh").must_be_installed
  end

  it 'installs zsh documentation' do
    zsh_doc_pkg = case node['platform']
                  when "ubuntu", "debian"
                    'zsh-doc'
                  when "centos"
                    'zsh-html'
                  end
    package(zsh_doc_pkg).must_be_installed
  end

  it 'provides an executable in the default $PATH named zsh' do
    assert which("zsh")
  end
end
