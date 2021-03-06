#
# Cookbook Name:: SQLServer
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe 'apt::default'
# include_recipe 'SQLServer::database'

package 'mysql-server' do
  action :install
end

package 'mysql' do
  action :install
end

mysql_client 'default' do
  action :create
end

mysql_service 'default' do
  initial_root_password 'change me'
  action [:create, :start]
end
