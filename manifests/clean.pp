#
class repo::clean {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      class { 'repo::clean::apt-clean':
        stage   => 'setup',
        require => Class['::repo::setup'],
      }
    }

    'RedHat', 'CentOS' : {
      class { 'repo::clean::yum-clean':
        stage   => 'setup',
        require => Class['::repo::setup'],
      }
    }
  }
}


class repo::clean::yum-clean (
  $yum_options = '',
  ) {
  exec { 'yum clean all':
    command => "/usr/bin/yum -q ${yum_options} clean all",
    timeout => 0,
  }
}


class repo::clean::apt-clean (
  $apt_options = '',
  ) {
  exec { 'apt clean':
    command => "/usr/bin/apt-get -q ${apt_options} clean",
    timeout => 0,
  }
}
