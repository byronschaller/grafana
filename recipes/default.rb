#
# Cookbook Name:: grafana
# Recipe:: default
#
# Copyright (c) 2016 Byron Schaller, All Rights Reserved.

yum_repository 'grafana' do
  only_if { platform_family?('rhel') }
  description "Grafana Stable repo"
  baseurl "https://packagecloud.io/grafana/stable/el/6/$basearch"
  repo_gpgcheck true
  enabled true
  gpgcheck true
  gpgkey "https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana"
  sslverify true
  sslcacert "/etc/pki/tls/certs/ca-bundle.crt"
end

apt_repository 'grafana' do
  only_if { platform_family?('debian') }
  uri 'https://packagecloud.io/grafana/stable/debian'
  components ['main']
  distribution 'jessie'
  key 'https://packagecloud.io/gpg.key'
  action :add
end

package 'grafana' do
  action :install
end

service 'grafana-server' do
  action [:enable, :start]
end
