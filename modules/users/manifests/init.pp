## Manage users via hiera
<<<<<<< HEAD
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

=======
## Example of hieradata file below
## By: atree@dragonrealm.net

#---
#users:
#  <username>:
#    comment:    <real name>
#    password:   <password hash>
#    uid:        <User ID>
#    shell:      <Path to shell>
#    managehome: true
#    groups:
#      - <list of groups>
>>>>>>> 2d5ed3c0143b5c6e61c470a5e31fa0a458cf0537

class users {
  $users = hiera("users")
  create_resources(user, $users)
}
