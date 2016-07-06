#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node['mackerel']['iptables']['services'].each do |svc|
  service svc do
    action [ :disable,  :stop ]
    supports :status => true, :start => true, :stop => true, :restart => true
  end
end
