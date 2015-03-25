## Users module using hiera
## By: atree@dragonrealm.net

# hieradata/os/$::osfamily.yaml
#---
#  bash:       /path/to/bash
#  csh:        /path/to/csh
#  admingroup: [wheel|sudo|etc]

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
  $users = hiera('users')
  create_resources(user, $users)
}
