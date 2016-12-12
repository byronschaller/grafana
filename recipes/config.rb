template "/etc/grafana/grafana.ini" do
  source "grafana.ini.erb"
  owner "grafana"
  group "grafana"
  mode 0644
  variables(
    :instance_name => node["grafana"]["config"]["instance_name"],
    :path_data => node["grafana"]["config"]["paths"]["data"]
  )
end
