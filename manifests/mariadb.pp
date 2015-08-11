#
class repo::mariadb($version='5.5') {
  include stdlib

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
