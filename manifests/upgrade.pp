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
    command => "/usr/bin/yum -y -q ${yum_options} update",
    timeout => 0,
  }
}


class repo::upgrade::apt-upgrade(
  $apt_options = '',
  ) {
  exec { 'apt upgrade':
    command => "/usr/bin/apt-get -y -q ${apt_options} upgrade",
    timeout => 0,
  }
}
