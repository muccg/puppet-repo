
class repo::repo::hpacucli($arch='x86_64', $priority='90') {
  include stdlib

  class { 'repo::repo::hpacucli::setup':
    stage    => 'setup',
    priority => $priority,
    arch     => $arch
  }
}


class repo::repo::hpacucli::setup($arch = 'x86_64', $priority = '90') {
  include ccgcommon

  $release = $::majdistrelease

  apt::source{'hpacucli':
    key         => 'E084DAB9',
    location    => 'http://bpamirror:81/hpa',
    release     => './',
    repos       => '',
    include_src => false,
  }
}
