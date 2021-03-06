#
class repo::ccgcentos($priority='70') {
  include stdlib

  yum::managed_yumrepo { 'ccg':
    descr          => 'CCG Packages for Enterprise Linux 6 - $basearch',
    baseurl        => 'http://repo.ccgapps.com.au/repo/ccg/centos/6/os/$basearch',
    enabled        => 1,
    gpgcheck       => 0,
    priority       => $priority,
  }

  if defined(Class['repo::update::yum-check-update']) {
    Class['repo::repo::ccgcentos::setup'] -> Class['repo::update::yum-check-update']
  }

}
