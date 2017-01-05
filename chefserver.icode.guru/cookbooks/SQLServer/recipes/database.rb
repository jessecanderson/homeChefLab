#
# Cookbook Name:: SQLServer
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

mysql_client 'default' do
  action :create
end

mysql_service 'default' do
  inital_root_password 'initalPassword'
  action [:create, :start]
end
