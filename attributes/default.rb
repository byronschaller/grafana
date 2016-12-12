default["grafana"]["config"]["instance_name"] = node["hostname"]
default["grafana"]["config"]["paths"]["data"] = "/opt/grafana/data"
default["grafana"]["config"]["paths"]["logs"] = "/var/log/grafana"

default["grafana"]["config"]["server"]["http_addr"] = ""
default["grafana"]["config"]["server"]["http_port"] = 3000
default["grafana"]["config"]["server"]["protocol"] = "http"
default["grafana"]["config"]["server"]["domain"] = ""
default["grafana"]["config"]["server"]["enforce_domain"] = false
default["grafana"]["config"]["server"]["root_url"] = ""
default["grafana"]["config"]["server"]["static_root_path"] = "public"

if node["grafana"]["config"]["server"]["protocol"] == "https"
  default["grafana"]["config"]["server"]["cert_file"] = ""
  default["grafana"]["config"]["server"]["cert_key"] = ""
end

default["grafana"]["config"]["database"]["type"] = "sqlite3"
default["grafana"]["config"]["database"]["name"] = "grafana"

if node["grafana"]["config"]["database"]["type"] == "sqlite3"
  default["grafana"]["config"]["database"]["path"] = "/opt/grafana/data/db"
end

unless node["grafana"]["config"]["database"]["type"] == "sqlite3"
  default["grafana"]["config"]["database"]["host"] = ""
  default["grafana"]["config"]["database"]["user"] = ""
  default["grafana"]["config"]["database"]["password"] = ""
  default["grafana"]["config"]["database"]["ssl_mode"] = ""
end

if node["grafana"]["config"]["database"]["type"] == "mysql"
  default["grafana"]["config"]["database"]["ca_cert_path"] = ""
  default["grafana"]["config"]["database"]["client_key_path"] = ""
  default["grafana"]["config"]["database"]["client_cert_path"] = ""
  default["grafana"]["config"]["database"]["server_cert_name"] = ""
end

default["grafana"]["config"]["security"]["admin_user"] = "admin"
default["grafana"]["config"]["security"]["admin_password"] = "admin"
default["grafana"]["config"]["security"]["login_remember_days"] = 1
default["grafana"]["config"]["security"]["secret_key"] = ""
default["grafana"]["config"]["security"]["disable_gravatar"] = false
