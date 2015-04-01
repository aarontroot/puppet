# ntp module
class ntp {
  package { 'ntp':
    ensure => latest,
  }

  service { 'ntp':
    ensure => running,
    enable => true,
  }
}
