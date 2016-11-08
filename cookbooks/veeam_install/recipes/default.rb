#
# Cookbook Name:: veeam_install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package_url = node['veeam']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"
license_local_path = "#{Chef::Config[:file_cache_path]}/veeam_backup_trial_32_0.lic"

remote_file package_local_path do
  action :create_if_missing
  source package_url
  #notifies :run, 'execute[veeam_installer]', :immediately
end

cookbook_file "#{Chef::Config[:file_cache_path]}/veeam_backup_trial_32_0.lic" do
  source "veeam_backup_trial_32_0.lic"
end

# Mounting the SQL Server 2014 SP1 ISO.
powershell_script 'Mount_Veeam_ISO' do
  code <<-EOH
  Mount-DiskImage -ImagePath "#{package_local_path}"
  EOH
  guard_interpreter :powershell_script
  #not_if '($SQL_Server_Service = (gwmi -class Win32_Service | Where-Object {$_.Name -eq "MSSQLSERVER"}).Name -eq "MSSQLSERVER")'
end

execute 'veeam_installer' do
  command "msiexec.exe /i #{package_local_path} ACCEPTEULA=\"YES\" VBR_LICENSE_FILE=\"#{license_local_path}\" VBR_SERVICE_USER=\"veeam_srvc\" VBR_SERVICE_PASSWORD=\"Password1\" "
  action :nothing
end
