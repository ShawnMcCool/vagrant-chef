package "build-essential" do
  action :install
end

# gems with precompiled binaries
%w{ guard }.each do |guard_gem|
  chef_gem guard_gem do
    action :install
  end
end