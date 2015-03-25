## Manage users via hiera
## Example of hieradata file below.  Shell and groups also need
## to be defined in hieradata/os/$::osfamily files
## By: atree@dragonrealm.net

# hieradata/users.yaml
#---
#users:
# <username>:
#   comment:    <real name>
#   password:   <password hash>
#   uid:        <User ID>
#   managehome: true
#   shell:      "%{hiera('<desired shell>')}"
#   groups:
#     -  "%{hiera('admingroup')}"


class users {
  $users = hiera("users")
  create_resources(user, $users)
}
