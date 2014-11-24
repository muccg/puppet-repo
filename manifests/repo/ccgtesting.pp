#
class repo::repo::ccgtesting($priority='70') {
  include stdlib

  class { 'repo::repo::ccgtesting::setup':
    priority => $priority,
    stage    => 'setup',
  }
}


class repo::repo::ccgtesting::setup($priority='70') {
  yum::managed_yumrepo { 'ccg-testing':
    descr          => 'CCG Packages for Enterprise Linux 6 - Testing - $basearch',
    baseurl        => 'http://repo.ccgapps.com.au/repo/ccg/centos/6_testing/os/$basearch',
    enabled        => 1,
    gpgcheck       => 0,
    priority       => $priority,
  }
}
