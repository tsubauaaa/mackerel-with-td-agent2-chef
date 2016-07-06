require 'serverspec'

set :backend, :exec

describe package('td-agent') do
  it { should be_installed }
end

describe service('td-agent') do
  it { should be_enabled }
  it { should be_running }
end

%w(fluent-plugin-datacounter fluent-plugin-mackerel).each do |fluent|
  describe command('/opt/td-agent/embedded/bin/gem list') do
    its(:stdout) { should contain( fluent ) }
  end
end

describe file('/etc/td-agent/td-agent.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode '644' }
  its(:content) { should match /include conf\.d\/\*\.conf/ }
end

describe file('/etc/td-agent/conf.d') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode '775' }
end

describe file('/etc/sysconfig/td-agent') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode '644' }
  its(:content) { should match /TD_AGENT_USER=root/ }
  its(:content) { should match /TD_AGENT_GROUP=root/ }
end
