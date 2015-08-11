#
class repo::ccgtesting($priority='70') {
  include stdlib

  yum::managed_yumrepo { 'ccg-testing':
    descr          => 'CCG Packages for Enterprise Linux 6 - Testing - $basearch',
    baseurl        => 'http://repo.ccgapps.com.au/repo/ccg/centos/6_testing/os/$basearch',
    enabled        => 1,
    gpgcheck       => 0,
    priority       => $priority,
  }

  if defined(Class['repo::update::yum-check-update']) {
    Class['repo::repo::ccgtesting::setup'] -> Class['repo::update::yum-check-update']
  }
}
