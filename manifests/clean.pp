#
class repo::clean {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      include repo::clean::apt-clean
    }

    'RedHat', 'CentOS' : {
      include repo::clean::yum-clean
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
