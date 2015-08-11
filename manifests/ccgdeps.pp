#
class repo::ccgdeps($priority='70') {

  yum::managed_yumrepo { 'ccg-deps':
    descr          => 'CCG Packages for Enterprise Linux 6 - Deps - $basearch',
    baseurl        => 'http://repo.ccgapps.com.au/repo/ccg-deps/centos/6/os/$basearch',
    enabled        => 1,
    gpgcheck       => 0,
    priority       => $priority,
  }

  if defined(Class['repo::update::yum-check-update']) {
    Class['repo::repo::ccgdeps::setup'] -> Class['repo::update::yum-check-update']
  }

}
