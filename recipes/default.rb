#
# Cookbook Name:: mackerel
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'mackerel::iptables' if node['mackerel']['iptables']['config'] == 'disabled'

execute 'install_mackerel_repo' do
  command <<-"EOH"
    curl -fsSL https://mackerel.io/assets/files/scripts/setup-yum.sh | sh
  EOH
  action :run
  not_if { ::File.exist?('/etc/yum.repos.d/mackerel.repo') }
end

node['mackerel']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/mackerel-agent/mackerel-agent.conf' do
  source 'mackerel-agent.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'mackerel-agent' do
  action [:enable, :start]
end

include_recipe 'mackerel::td_agent2'
