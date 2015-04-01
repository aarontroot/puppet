# ntpdate/manifests/init.pp
class ntpdate {
  package { 'ntpdate':
    ensure => latest,
  }
}
