#
class repo::erlang($arch = 'x86_64', $priority = '90') {
  include stdlib

  $release = $::majdistrelease

  yumrepo {'erlang-solutions':
    priority   => $priority,
    baseurl    => "http://binaries.erlang-solutions.com/rpm/centos/${release}/${arch}",
    gpgkey     => 'http://binaries.erlang-solutions.com/debian/erlang_solutions.asc',
  }

}
