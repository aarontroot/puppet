class roles::common {
  include bash
  include hosts
  include motd
  include ntp
  include ntpdate
  include puppet
  include ssh
  include sudo
  include users
  include virtual-guest
}
