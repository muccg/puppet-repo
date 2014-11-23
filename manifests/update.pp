#
class repo::update {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      class { 'apt::update':
        stage => 'setup',
      }
    }

    'RedHat', 'CentOS' : {
      class { 'repo::update::yum-check-update':
        stage => 'setup',
      }
    }
  }
}


class repo::update::yum-check-update {
  exec { 'yum check-update':
    command => '/usr/bin/yum check-update'
  }
}
