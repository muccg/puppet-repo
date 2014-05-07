#
class repo::rcran($release='saucy') {
  include stdlib

  class { 'repo::rcran::setup':
    stage   => 'setup',
    release => $release,
  }
}


class repo::rcran::setup ($release) {

  apt::source{'r-cran':
    key         => 'E084DAB9',
    location    => 'http://cran.r-project.org/bin/linux/ubuntu',
    release     => "${release}/",
    repos       => '',
    include_src => false,
  }
}
