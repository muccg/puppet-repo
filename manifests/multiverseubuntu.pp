#
class repo::multiverseubuntu($release='saucy') {
  include stdlib

  class { 'repo::multiverseubuntu::setup':
    stage   => 'setup',
    release => $release,
  }
}


class repo::multiverseubuntu::setup ($release) {

  apt::source { 'ubuntu_archive_saucy':
    location        => 'http://nova.clouds.archive.ubuntu.com/ubuntu/',
    release         => $release,
    repos           => 'multiverse',
    include_src     => false
  }

  apt::source { 'ubuntu_archive_saucy-updates':
    location        => 'http://nova.clouds.archive.ubuntu.com/ubuntu/',
    release         => "${release}-updates",
    repos           => 'multiverse',
    include_src     => false
  }

  apt::source { 'ubuntu_archive_saucy-security':
    location        => 'http://nova.clouds.archive.ubuntu.com/ubuntu/',
    release         => "${release}-security",
    repos           => 'multiverse',
    include_src     => false
  }
}
