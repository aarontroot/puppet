class roles::common {
  include bash
  include puppet
  include ssh
  include sudo
  include users
  include virtual-guest
}
