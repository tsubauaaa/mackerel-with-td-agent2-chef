#
# Cookbook Name:: td_agent2
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute 'install_td-agent2' do
  command <<-"EOH"
    curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
  EOH
  action :run
  not_if { ::File.exist?('/etc/td-agent/td-agent.conf') }
end

node['mackerel']['td_agent2']['gems'].each do |gem|
  gem_package gem do
    gem_binary '/opt/td-agent/embedded/bin/gem'
    action :install
  end
end

directory '/etc/td-agent/conf.d' do
  owner 'root'
  group 'root'
  mode '0775'
  recursive true
  action :create
  only_if { ::File.exist?('/etc/td-agent/td-agent.conf') }
end

template '/etc/td-agent/td-agent.conf' do
  source 'td-agent.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  only_if { ::File.exist?('/etc/td-agent/td-agent.conf') }
end

template '/etc/td-agent/conf.d/mackerel-secure-log.conf' do
  source 'mackerel-secure-log.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/sysconfig/td-agent' do
  source 'td-agent.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'td-agent' do
  action [:enable, :start]
end
