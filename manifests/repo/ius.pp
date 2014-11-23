#
class repo::repo::ius($arch='x86_64', $priority='20') {
  include stdlib

  class { 'repo::repo::ius::setup':
    stage    => 'setup',
    priority => $priority,
    arch     => $arch
  }
}


class repo::repo::ius::setup($arch='x86_64', $priority='20') {
  # there is an ius-release RPM available but it has a dependency on
  # the epel-release package being installed. Since we use the
  # stahnma-epel puppet module, this dependency would never be
  # satisfied. So instead, the repo is setup by hand.
  yumrepo { 'ius':
    descr      => "IUS Community Packages for Enterprise Linux 6 - ${arch}",
    mirrorlist => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-centos${::majdistrelease}&arch=${arch}",
    enabled    => 1,
    gpgcheck   => 0
  }

  yumrepo { 'ius-source':
    descr      => "IUS Community Packages for Enterprise Linux 6 - ${basearch} - Source",
    #mirrorlist => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-centos${::majdistrelease}&arch=${arch}",
    baseurl    => "http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/SRPMS",
    enabled    => 0,
    gpgcheck   => 1
  }
}
