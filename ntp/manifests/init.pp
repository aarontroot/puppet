# ntp module
# Does not install on FreeBSD as its part of the os
# By: atree@dragonrealm.net
class ntp {
  if $::osfamily != 'FreeBSD' {
    package { 'ntp':
      ensure => latest,
    }

    service { 'ntp':
      ensure => running,
      enable => true,
    }
  }
}
