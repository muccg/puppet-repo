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
  include common

  $release = $::majdistrelease

  yumrepo {'base':
    priority   => $priority,
    baseurl    => 'absent',
    mirrorlist => "http://mirrorlist.centos.org/?release=${release}&arch=${arch}&repo=os"
  }

  yumrepo {'updates':
    priority   => $priority,
    baseurl    => 'absent',
    mirrorlist => "http://mirrorlist.centos.org/?release=${release}&arch=${arch}&repo=updates"
  }

  yumrepo {'extras':
    priority   => $priority,
    baseurl    => 'absent',
    mirrorlist => "http://mirrorlist.centos.org/?release=${release}&arch=${arch}&repo=extras"
  }
}
