# Module to manage puppetmaster
# Keeps puppetmaster on latest version and start on boot enabled
# By: atree@dragonrealm.net
class puppet::master {
  case $::osfamily {
    'Debian': {
      $package = [ 'puppetmaster-common', 'puppetmaster' ]
      $config  = '/etc/puppet/puppet.conf'
      $service = 'puppetmaster'
    }
    'FreeBSD': {
      $package = 'puppet'
      $config  = '/usr/local/etc/puppet/puppet.conf'
      $service = 'puppetmaster'
    }
    default: {
      fail("Module ${module_name} not configured for ${::osfamily}")
    }
  }

  package { $package:
    ensure => latest,
  }
  
  if ($::osfamily == 'Debian') {
    augeas { '/etc/default/puppetmaster':
      changes => 'set /files/etc/default/puppetmaster/START yes',
    }
  }
  
  service { $service:
    ensure => running,
    enable => true,
  }
}
