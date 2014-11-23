#
class repo::upgrade {
  include stdlib
  include repo::update

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      class { 'repo::upgrade::apt-upgrade':
        stage => 'setup',
      }
    }

    'RedHat', 'CentOS' : {
      class { 'repo::upgrade::yum-update':
        stage => 'setup',
      }
    }
  }
}


class repo::upgrade::yum-update (
  $yum_options = '--disablerepo=ccg*',
  ) {
  exec { 'yum update':
    command => "yum -y -q ${yum_options} update"
  }
}


class repo::upgrade::apt-upgrade(
  $apt_options = '',
  ) {
  exec { 'apt upgrade':
    command => "apt-get -y -q ${apt_options} upgrade"
  }
}
