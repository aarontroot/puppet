# sudo/manifests/init.pp
class sudo {
  $admingroup   = hiera('admingroup')
  $sudoersdpath = hiera('sudoersdpath')

  package { 'sudo':
    ensure => latest,
  }

  file { "sudo_${admingroup}":
    ensure  => file,
    path    => "${sudoersdpath}/group_${admingroup}",
    content => "%${admingroup} ALL=(ALL:ALL) ALL",
  }
}
