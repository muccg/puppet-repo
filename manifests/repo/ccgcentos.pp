#
class repo::repo::ccgcentos() {
  include stdlib

  class { 'repo::ccgcentos::setup':
    stage    => 'setup',
  }
}


class repo::repo::ccgcentos::setup() {
  include ccgcommon

  $release = $::majdistrelease
  $ccg_release_rpm = "ccg-release-${release}-2"
  $ccg_release_url = "http://repo.ccgapps.com.au/repo/ccg/centos/${release}/os/noarch/CentOS/RPMS/${ccg_release_rpm}.noarch.rpm"

  package { 'ccg-release':
      ensure => purged
  } ->

  package { $ccg_release_rpm:
    ensure   => present,
    alias    => 'ccg-release-install',
    source   => $ccg_release_url,
    provider => rpm
  }
}
