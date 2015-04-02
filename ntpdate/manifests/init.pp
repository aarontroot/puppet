# ntpdate module
# Does not install on FreeBSD as it is included in the os
# By: atree@dragonrealm.net
class ntpdate {
  if $::osfamily != 'FreeBSD' {
    package { 'ntpdate':
      ensure => latest,
    }
  }
}
