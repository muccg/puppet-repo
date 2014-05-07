#
class repo::remi($arch='x86_64', $priority='80') {
  include stdlib

  class { 'repo::remi::setup':
    stage    => 'setup',
    priority => $priority,
    arch     => $arch
  }
}


class repo::remi::setup($arch='x86_64', $priority='80') {
  include ccgcommon

  $release = $::majdistrelease

  yumrepo {'remi':
    name           => 'remi',
    mirrorlist     => "http://rpms.famillecollet.com/enterprise/${release}/remi/mirror",
    baseurl        => 'absent',
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    priority       => $priority
  }

  yumrepo {'remi-test':
    name           => 'remi-test',
    mirrorlist     => "http://rpms.famillecollet.com/enterprise/${release}/test/mirror",
    baseurl        => 'absent',
    enabled        => 0,
    gpgcheck       => 0,
    priority       => $priority
  }
}
