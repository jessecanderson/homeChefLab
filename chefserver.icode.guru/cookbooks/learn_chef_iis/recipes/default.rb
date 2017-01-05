#
# Cookbook Name:: learn_chef_iis
# Recipe:: default
#
# Copyright (C) 2014
#
#
#
#powershell_script 'Install IIS' do
#  code 'Add-WindowsFeature Web-Server'
#  guard_interpreter :powershell_script
#  not_if "(Get-WindowsFeature -Name Web-Server).InstallState -eq 'Installed'"
#end


#service 'w3svc' do
#  action [:enable, :start]
#end

#windows_package 'IIS-WebServer' do
#  action :install
#end

#windows_package 'TelnetClient' do
#  action :install
#end

#windows_package 'TelnetServer' do
#  action :install
#end

#service 'w3svc' do
#  action [:enable, :start]
#end

#template 'c:\inetpub\wwwroot\Default.htm' do
#  source 'Default.htm.erb'
#end

include_recipe 'learn_chef_iis::install_notepad'
