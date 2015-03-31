# ssh/manifests/init.pp
class ssh {
  $PermitRootLogin        = 'no'
  $PasswordAuthentication = 'yes'
  $PubkeyAuthentication   = 'no'
  
  case $::osfamily {
    'Debian': {
      $cfg = '/etc/ssh/sshd_config'
      $svc = 'ssh'
    }
    'FreeBSD': {
      $cfg = '/etc/ssh/sshd_config'
      $svc = 'sshd'
    }
    default: {
      fail("${module_name} does not support ${::osfamily}")
    }
  }

  if $::osfamily != 'FreeBSD' {
    package { 'openssh-server':
      ensure => latest,
    }
  }

  file { $cfg:
    ensure => file,
    content => template("${module_name}/sshd_config.erb"),
  }

  service { $svc:
    ensure    => running,
    enable    => true,
    subscribe => File[$cfg],
  }
}
