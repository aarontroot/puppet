# ssh/manifests/init.pp
class ssh {
  $PermitRootLogin = 'no'
  $PasswordAuthentication = 'yes'
  
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

  augeas { '/etc/ssh/sshd_config':
    changes => [
      "set /files/${cfg}/PermitRootLogin ${PermitRootLogin}",
      "set /files/${cfg}/PasswordAuthentication ${PasswordAuthentication}",
    ],
  }

  service { $svc:
    ensure    => running,
    enable    => true,
    subscribe => Augeas['/etc/ssh/sshd_config'],
  }
}
