Splunk Getting Data In (GDI) Example: HashiCorp Vault
------------

This directory contains example configuration files for ingesting
HashiCorp Vault metrics & logs into Splunk. 

These examples should be used with the Vault App for Splunk.

See the [HashiCorp Learn tutorial](https://learn.hashicorp.com/tutorials/vault/monitor-telemetry-audit-splunk#practical-example) for more info and other options.

If you use these files, here are the items you'll need to configure specific to your environment:

(Note: this assumes you have Vault, the Splunk Universal Forwarder, and telegraf on the same host)

**Vault Configuration**

1. In the 'telemetry' stanza, set the 'dogstatsd_addr' property .

* It must be point to a statsd protocol-compatible listener
* It can be localhost or another server with telegraf installed

2. Set 'cluster_name' so the Splunk app can appropriately filter per cluster.

**Telegraf Configuration**

1. Make changes to anything under the [global] stanza, as needed.
1. Optionally set the telegraf listen address (if different from default) in [[inputs.statsd]].
1. Set 'files' path under [[outputs.file]] where telegraf should output the metrics logs.

**Splunk Configuration**

1. Place the 3 .conf files in the local directory of the Vault App for Splunk

    ex. $SPLUNK_HOME/etc/apps/vault-app-for-splunk/local/
1. Modify inputs.conf and set:
* the file paths to monitor
* hostname of the Vault server
1. You may need to restart Splunk after making these changes.

Disclaimer: These example configuration files are provided AS-IS, with no warranty or support expressed or implied.