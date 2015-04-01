# motd/manifests/init.pp
class motd {
  file { '/etc/motd':
    ensure  => file,
    owner   => 0,
    group   => 0,
    content => template('motd/motd.erb'),
  }
}
