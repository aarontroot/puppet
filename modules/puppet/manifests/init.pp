# == Class: puppet
#
# Full description of class puppet here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'puppet':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class puppet {
  case $::osfamily {
    'Debian': {
      $package = [ 'puppet-common', 'puppet' ]
      $service = 'puppet'
    }
    default: {
      fail("Module ${module_name} not configured for ${::osfamily}")
    }
  }

  package { $package:
    ensure => latest,
  }

  augeas { '/etc/default/puppet':
    changes => 'set /files/etc/default/puppet/START yes',
  }

  augeas { '/etc/puppet/puppet.conf':
    changes => 'rm /files/etc/puppet/puppet.conf/main/templatedir',
  }

  service { $service:
    ensure => running,
    enable => true,
  }
}
