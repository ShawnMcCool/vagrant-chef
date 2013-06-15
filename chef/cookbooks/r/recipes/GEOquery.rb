case node['platform']
when "ubuntu", "debian"

	package "libcurl4-openssl-dev" do
		action :install
	end

end
