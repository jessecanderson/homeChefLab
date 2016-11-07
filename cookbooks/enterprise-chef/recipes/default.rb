#
# Cookbook Name:: enterprise-chef
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package_url = node['enterprise-chef']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"


# omnibus_package is remote (i.e., a URL) let's download it
remote_file package_local_path do 
	source package_url
end

package package_local_path

# reconfigure the installation

execute 'chef-server-ctl reconfigure'
