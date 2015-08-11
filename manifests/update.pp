#
class repo::update {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      include repo::update::apt-update
    }

    'RedHat', 'CentOS' : {
      include repo::update::yum-check-update
    }
  }
}


class repo::update::yum-check-update {
  exec { 'yum check-update':
    command => '/usr/bin/yum check-update',
    returns => ['0', '100'],
  }
}


class repo::update::apt-update (
  $apt_options = '',
  ) {
  exec { 'apt update':
    command => "/usr/bin/apt-get -q ${apt_options} update",
  }
}
