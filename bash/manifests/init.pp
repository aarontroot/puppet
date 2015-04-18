# Ensure that bash is current
class bash {
  package { 'bash':
    ensure => latest,
  }
}
