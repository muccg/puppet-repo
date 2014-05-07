#
class repo::update {
  include ccgcommon

  case $::operatingsystem {

    # not really sure of a good way to do this for ubuntu
    # this should be considered a place holder
    'Ubuntu', 'Debian' : {
      exec { 'unattended-upgrade':
        command   => 'unattended-upgrade || true',
        provider  => 'shell',
        logoutput => true,
        timeout   => 0,
        require   => Package['unattended-upgrades'],
      }
    }

    'CentOS' : {
      case $::majdistrelease {

        '6' : {
          # don't update from ccg repos
          exec { 'yum update --security':
            command   => 'yum update -y --disablerepo=ccg* --security || true',
            provider  => 'shell',
            logoutput => true,
            timeout   => 0,
            require   => Package['yum-plugin-security'],
          }
        }

        '5' : {
          # brute force centos 5
          # don't update from ccg repos
          exec { 'yum update':
            command   => 'yum update -y --disablerepo=ccg* || true',
            provider  => 'shell',
            logoutput => true,
            timeout   => 0,
          }
        }

        default: {
          fail("CentOS ${::majdistrelease} no supported")
        }
      }
    }

    default : {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
    }
  }
}
