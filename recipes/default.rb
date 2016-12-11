#
# Cookbook Name:: grafana
# Recipe:: default
#
# Copyright (c) 2016 Byron Schaller, All Rights Reserved.

yum_repository 'grafana' do
  description "Grafana Stable repo"
  baseurl "https://packagecloud.io/grafana/stable/el/6/$basearch"
  repo_gpgcheck true
  enabled true
  gpgcheck true
  gpgkey "https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana"
  sslverify true
  sslcacert "/etc/pki/tls/certs/ca-bundle.crt"
end
