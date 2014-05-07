# Using this class disables the ccg release repo and enables the
# ccg-testing repo.
# This would be useful for staging setups.
class repo::ccgtesting() {
  include stdlib

  class { 'repo::ccgtesting::setup':
    stage => 'setup',
  }
}


class repo::ccgtesting::setup() {

  exec {'ccg repo disable':
    command => "/bin/sed -i -e 's/^enabled[ ]*=[ ]*1.*/enabled=0/i' ccg.repo",
    onlyif  => "/bin/grep -i '^enabled=1' ccg.repo",
    cwd     => '/etc/yum.repos.d',
    require => Class['repo::ccgcentos']
  }

  exec {'ccg testing repo enable':
    command => "/bin/sed -i -e 's/^enabled[ ]*=[ ]*0.*/enabled=1/i' ccg-testing.repo",
    onlyif  => "/bin/grep -i '^enabled=0' ccg-testing.repo",
    cwd     => '/etc/yum.repos.d',
    require => Class['repo::ccgcentos']
  }
}
