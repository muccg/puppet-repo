#
class repo::ubuntuccg() {
  include stdlib

  apt::key { 'ccg':
    key        => 'D50582E6',
    key_source => 'http://repo.ccgapps.com.au/repo/ccg/ubuntu/ccg-archive.asc',
  }

  apt::source { 'ubuntu-ccg':
    location     => 'http://repo.ccgapps.com.au/repo/ccg/ubuntu',
    release      => 'ccg',
    repos        => 'universe',
    include_src  => true,
    key          => 'D50582E6',
    require      => Apt::Key['ccg'],
  }
}
