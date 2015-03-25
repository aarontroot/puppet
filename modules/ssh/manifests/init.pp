# ssh/manifests/init.pp
class ssh {
  $PermitRootLogin = 'no'
  $PasswordAuthentication = 'yes'
  $svc = $::osfamily ? {
    Debian  => 'ssh',
    Freebsd => 'sshd',
    Default => fail("${module_name} does not support ${::osfamily}"),
  }

  if $::osfamily != 'FreeBSD' {
    package { 'openssh-server':
      ensure => latest,
    }
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,
    content => template('ssh/sshd_config.erb'),
  }

  service { $svc:
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/ssh/sshd_config'],
  }
}
