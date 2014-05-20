#
#[erlang-solutions]
#name=Centos $releasever - $basearch - Erlang Solutions
#baseurl=http://binaries.erlang-solutions.com/rpm/centos/$releasever/$basearch
#gpgcheck=1
#gpgkey=http://binaries.erlang-solutions.com/debian/erlang_solutions.asc
#enabled=1
class repo::ceph($arch='x86_64', $priority='90') {
  include stdlib

  class { 'repo::ceph::setup':
    stage    => 'setup',
  }
}


class repo::ceph::setup() {
  include ccgcommon

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
