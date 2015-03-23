# Manage users via hiera
#users:
#  <username>:
#    comment:    <real name>
#    password:   <password hash>
#    uid:        <User ID>
#    shell:      <Path to shell>
#    managehome: true
#    groups:
#      - <list of groups>

class users {
  $users = hiera("users")
  create_resources(user, $users)
}
