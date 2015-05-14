#
class repo::repo::mariadb($version='5.5') {
  include stdlib

  class { 'repo::repo::mariadb::setup':
    stage   => 'setup',
    version => $version
  }
}


class repo::repo::mariadb::setup($version='5.5') {

  apt::key { 'mariadb':
    key => '0xcbcb082a1bb943db',
  }

  apt::source{'mariadb':
    location    => "http://mirror.aarnet.edu.au/pub/MariaDB/repo/${version}/ubuntu/",
    repos       => 'main',
    release     => $::lsbdistcodename,
    include_src => false,
  }

}
