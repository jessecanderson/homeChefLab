#
# Cookbook Name:: motd-attributes
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template "/etc/motd" do
	source "motd.erb"
	mode "0644"
end
