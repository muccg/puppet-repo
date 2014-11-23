# @name :
# @desc :
# @info :  In case we don't want to use aws postgresql rpms
class repo::pgrpms() {
  include stdlib

  class { 'repo::pgrpms::setup':
    stage    => 'setup',
  }
}


class repo::pgrpms::setup() {
  include ccgcommon

  case $::operatingsystem {
    'RedHat': {
      $package = 'pgdg-redhat93-9.3-1.noarch'
      case $::majdistrelease {
        '6' : {
          $url = 'http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm'
        }
        '5' : {
          $url = 'http://yum.postgresql.org/9.3/redhat/rhel-5-x86_64/pgdg-redhat93-9.3-1.noarch.rpm'
        }
        default : {
          fail("Not supported on a RedHat ${::majdistrelease} based system.")
        }
      }
    }
    'CentOS' : {
      $package = 'pgdg-centos93-9.3-1.noarch'
      case $::majdistrelease {
        '6' : {
          $url = 'http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm'
        }
        '5' : {
          $url = 'http://yum.postgresql.org/9.3/redhat/rhel-5-x86_64/pgdg-centos93-9.3-1.noarch.rpm'
        }
        default : {
          fail("Not supported on a CentOS ${::majdistrelease} based system.")
        }
      }
    }
    default: {
      fail("${::operatingsystem} is not supported.")
    }
  }

  package {$package:
    ensure   => installed,
    alias    => 'pgrpms',
    provider => 'rpm',
    source   => $url
  }
}
