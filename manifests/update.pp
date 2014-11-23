#
class repo::update {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      class { 'apt::update':
        stage   => 'setup',
        require => Class['::repo::setup'],
      }
    }

    'RedHat', 'CentOS' : {
      class { 'repo::update::yum-check-update':
        stage   => 'setup',
        require => Class['::repo::setup'],
      }
    }
  }
}


class repo::update::yum-check-update {
  exec { 'yum check-update':
    command => '/usr/bin/yum check-update',
    returns => ['0', '100'],
  }
}
