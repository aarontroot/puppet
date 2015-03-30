# Install virtualbox guest packages
class virtual-guest {
  case $::virtual {
    'kvm': {
      $pkglist = 'qemu-guest-agent'
    }
    'virtualbox': {
      $pkglist = [ 'virtualbox-guest-dkms', 'virtualbox-guest-utils', 'virtualbox-guest-x11' ]
    }
    'vmware':{
      $pkglist = 'open-vm-tools'
    }
    default: {
      # Catchall, do nothing
    }
  }

  if ($virtual in [ 'kvm', 'virtualbox', 'vmware' ]) {
    package { $pkglist:
      ensure => latest,
    }
  }
}
