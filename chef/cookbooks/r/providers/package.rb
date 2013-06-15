action :install do

	Chef::Log.info "Installing CRAN/BioC package #{new_resource.package_name}"
	bash "R_CRAN_BioC_package_install" do
		user "root"
		code <<-EOH
		R_CMD=`which R 2> /dev/null`
		if [ $? -ne 0 ]; then
			R_CMD=/usr/local/bin/R
		fi
		set -e
		cat <<-EOF | $R_CMD --no-save --no-restore --file=-
		if (!("#{new_resource.package_name}" %in% installed.packages())) {
			source("http://bioconductor.org/biocLite.R") 
			biocLite("#{new_resource.package_name}")
			stopifnot("#{new_resource.package_name}" %in% installed.packages())
		} 
		EOF
		EOH
	end

end

action :remove do

	Chef::Log.info "Remove R package #{new_resource.package_name}"
	bash "R_package_remove" do
		user "root"
		code <<-EOH
		R_CMD=`which R 2> /dev/null`
		if [ $? -ne 0 ]; then
			R_CMD=/usr/local/bin/R
		fi
		set -e
		cat <<-EOF | $R_CMD --no-save --no-restore --file=-
		package <- installed.packages()["#{new_resource.package_name}",]
		if (!is.na(package)) {
			remove.packages("#{new_resource.package_name}", package['LibPath'])
			stopifnot(!("#{new_resource.package_name}" %in% installed.packages()))
		}
		EOF
		EOH
	end

end
