class roles::common {
  include bash
  include motd
  include puppet
  include ssh
  include sudo
  include users
  include virtual-guest
}
