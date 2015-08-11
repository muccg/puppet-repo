#
class repo::rcran($release=$lsbdistcodename) {
  include stdlib

  apt::source{'r-cran':
    key         => 'E084DAB9',
    location    => 'http://cran.r-project.org/bin/linux/ubuntu',
    release     => "${release}/",
    repos       => '',
    include_src => false,
  }
}
