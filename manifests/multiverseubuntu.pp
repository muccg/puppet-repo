#
class repo::multiverseubuntu($release=$lsbdistcodename) {
  include stdlib

  apt::source { "ubuntu_archive_${release}":
    location        => 'http://nova.clouds.archive.ubuntu.com/ubuntu/',
    release         => $release,
    repos           => 'multiverse',
    include_src     => false
  }

  apt::source { "ubuntu_archive_${release}-updates":
    location        => 'http://nova.clouds.archive.ubuntu.com/ubuntu/',
    release         => "${release}-updates",
    repos           => 'multiverse',
    include_src     => false
  }

  apt::source { "ubuntu_archive_${release}-security":
    location        => 'http://nova.clouds.archive.ubuntu.com/ubuntu/',
    release         => "${release}-security",
    repos           => 'multiverse',
    include_src     => false
  }
}
