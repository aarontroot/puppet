## /etc/hosts module using hiera
## By: atree@dragonrealm.net

# hieradata/default.yaml
#---
#hosts:
#  <fqdn>:
#    host_aliases: <hostname or alias>
#    ip:           <ip address>

class hosts {
  $hosts = hiera('hosts')
  create_resources(host, $hosts)
}
