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
