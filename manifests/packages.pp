#
class repo::packages () {
  include stdlib

  class { 'repo::packages::setup':
    stage => 'setup'
  }
}


class repo::packages::setup () {

  include common

  case $::osfamily {

    'redhat': {
      case $::majdistrelease {

        '5': {
          $packages = 'yum-priorities'
        }

        '6': {
          $packages = ['yum-plugin-priorities', 'yum-plugin-security']
        }

        default: {
          fail ("repo::packages: ${::osfamily} ${::majdistrelease} is not supported.")
        }
      }
    }

    'Ubuntu', 'Debian' : {
      $packages = 'unattended-upgrades'
    }

    default: {
      fail ("repo::packages: ${::osfamily} is not supported.")
    }
  }

  package { $packages: ensure => installed }
}
