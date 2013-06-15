action :install do

	package_name = ::File.basename(new_resource.package_name).gsub(/(.+)_[0-9.]*\.tar\.gz\z/,'\1')
	Chef::Log.info "Installing filesystem package #{package_name} from #{new_resource.package_name}"
	bash "R_file_package_install" do
		user "root"
		code <<-EOH
		R_CMD=`which R 2> /dev/null`
		if [ $? -ne 0 ]; then
			R_CMD=/usr/local/bin/R
		fi
		set -e
		cat <<-EOF | $R_CMD --no-save --no-restore --file=-
		if (!("#{package_name}" %in% installed.packages())) {
			install.packages("#{new_resource.package_name}", repos=NULL)
			stopifnot("#{package_name}" %in% installed.packages())
		}
		EOF
		EOH
	end

end
