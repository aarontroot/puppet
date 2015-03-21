class users {
  $users = hiera("users")

  create_resources(user, $users)
}
