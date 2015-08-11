#
class repo::ceph() {
  include stdlib

  $release             = 'firefly'
  $apt_key_source      = 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc'
  $apt_key_id          = '17ED316D'

  apt::key { 'ceph':
    key        => $apt_key_id,
    key_source => $apt_key_source,
  }

  apt::source { 'ceph':
    location => "http://ceph.com/debian-${release}/",
    release  => $::lsbdistcodename,
    require  => Apt::Key['ceph'],
  }
}
