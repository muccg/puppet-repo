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
  yum::managed_yumrepo { 'ius':
    descr          => "IUS Community Packages for Enterprise Linux 6 - ${arch}",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-centos${::majdistrelease}&arch=${arch}",
    enabled        => 1,
    gpgcheck       => 0,
    priority       => $priority,
  }

  yum::managed_yumrepo { 'ius-source':
    descr          => "IUS Community Packages for Enterprise Linux 6 - ${arch} - Source",
    mirrorlist     => "http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-centos6-source&arch=source",
    enabled        => 0,
    gpgcheck       => 0,
  }

  if defined(Class['repo::update::yum-check-update']) {
    Class['repo::repo::ius::setup'] -> Class['repo::update::yum-check-update']
  }

}
