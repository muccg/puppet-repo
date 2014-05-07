
class repo::hpacucli($arch='x86_64', $priority='90') {
  include stdlib

  class { 'repo::hpacucli::setup':
    stage    => 'setup',
    priority => $priority,
    arch     => $arch
  }
}


class repo::hpacucli::setup($arch = 'x86_64', $priority = '90') {
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
