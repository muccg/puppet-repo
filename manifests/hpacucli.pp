#
# TODO hardcoded url that probably doesn't work anywhere
class repo::hpacucli($arch = 'x86_64', $priority = '90') {
  include stdlib

  $release = $::majdistrelease

  apt::source{'hpacucli':
    key         => 'E084DAB9',
    location    => 'http://bpamirror:81/hpa',
    release     => './',
    repos       => '',
    include_src => false,
  }
}
