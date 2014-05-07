#
#[erlang-solutions]
#name=Centos $releasever - $basearch - Erlang Solutions
#baseurl=http://binaries.erlang-solutions.com/rpm/centos/$releasever/$basearch
#gpgcheck=1
#gpgkey=http://binaries.erlang-solutions.com/debian/erlang_solutions.asc
#enabled=1
class repo::erlang($arch='x86_64', $priority='90') {
  include stdlib

  class { 'repo::erlang::setup':
    stage    => 'setup',
    priority => $priority,
    arch     => $arch
  }
}


class repo::erlang::setup($arch = 'x86_64', $priority = '90') {
  include ccgcommon

  $release = $::majdistrelease

  yumrepo {'erlang-solutions':
    priority   => $priority,
    baseurl    => "http://binaries.erlang-solutions.com/rpm/centos/${release}/${arch}",
    gpgkey     => 'http://binaries.erlang-solutions.com/debian/erlang_solutions.asc',
  }

}
