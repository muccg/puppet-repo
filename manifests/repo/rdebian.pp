#
class repo::repo::rdebian($release='stable') {
  include stdlib

  class { 'repo::repo::rdebian::setup':
    stage   => 'setup',
    release => $release,
  }
}


class repo::repo::rdebian::setup ($release) {

  apt::source{'r-debian':
    key         => 'B26DD379',
    location    => 'http://debian-r.debian.net/debian-r/',
    release     => $release,
    repos       => 'main',
    include_src => false,
  }

  apt::pin{'r-debian':
    priority => 990,
    origin   => 'debian-r.debian.net',
  }
}
