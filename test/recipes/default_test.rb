# # encoding: utf-8

# Inspec test for recipe grafana::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe yum.repo('grafana') do
  it { should exist }
  it { should be_enabled }
end

describe package('grafana') do
  it { should be_installed }
end

describe service('grafana-server') do
  it { should be_running }
  it { should be_enabled }
end
