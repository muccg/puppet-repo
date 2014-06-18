#
class repo::centos($arch='x86_64', $priority='99') {
  include stdlib

  class { 'repo::centos::setup':
    stage    => 'setup',
    priority => $priority,
    arch     => $arch
  }
}


class repo::centos::setup($arch = 'x86_64', $priority = '99') {
  include ccgcommon

  $release = $::majdistrelease

  yumrepo {'base':
    priority   => $priority,
    baseurl    => "http://mirror.aarnet.edu.au/pub/centos/${release}/os/${arch}/"
  }

  yumrepo {'updates':
    priority   => $priority,
    baseurl    => "http://mirror.aarnet.edu.au/pub/centos/${release}/updates/${arch}/"
  }

  yumrepo {'extras':
    priority   => $priority,
    baseurl    => "http://mirror.aarnet.edu.au/pub/centos/${release}/extras/${arch}/"
  }
}
