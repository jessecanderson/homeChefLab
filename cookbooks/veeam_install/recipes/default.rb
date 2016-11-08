#
# Cookbook Name:: veeam_install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package_url = node['veeam']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

remote_file package_local_path do
  action :create_if_missing
  source package_url
end
