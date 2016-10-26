


package 'bind9' do
  action :install
end

package 'dnsutils' do
  action :install
end

package 'bind9-doc' do
  action :install
end

template '/etc/bind/db.10' do
  source 'db.10.erb'
  notifies :restart, "service[bind9]"
end

template '/etc/bind/db.home.local' do
  source 'db.home.local.erb'
  notifies :restart, "service[bind9]"
end

template '/etc/bind/named.conf.local' do
  source 'named.conf.local.erb'
  notifies :restart, "service[bind9]"
end

template 'etc/bind/named.conf.options' do
  source 'named.conf.options.erb'
  notifies :restart, "service[bind9]"
end

service 'bind9' do
  action [:enable, :start]
end
