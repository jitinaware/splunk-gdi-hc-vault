storage "file" {
  path    = "vault/file"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}

disable_mlock = true

license_path = "vault/config/vault.hclic"

plugin_directory = "vault/plugins"

api_addr = "http://0.0.0.0:8200"
ui = true

cluster_name = "vault-cluster"

telemetry {
  dogstatsd_addr = "telegraf:8125" # address:port of statsd protocol-compatible listener, can be localhost or another server with telegraf installed
  enable_hostname_label = true
  prometheus_retention_time = "0h"
}