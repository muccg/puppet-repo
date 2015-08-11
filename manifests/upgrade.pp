#
class repo::upgrade {
  include stdlib
  include repo::update

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      include repo::upgrade::apt-upgrade
    }

    'RedHat', 'CentOS' : {
      include repo::upgrade::yum-update
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

  Class['repo::update::yum-check-update'] -> Class['repo::upgrade::yum-update']
}


class repo::upgrade::apt-upgrade (
  $apt_options = '',
  ) {
  exec { 'apt upgrade':
    command => "/usr/bin/apt-get -y -q ${apt_options} upgrade",
    timeout => 0,
  }

  Class['apt::update'] -> Class['repo::upgrade::apt-upgrade']
}
