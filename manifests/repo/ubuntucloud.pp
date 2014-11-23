#
class repo::ubuntucloud($arch='x86_64', $priority='90') {
  include stdlib

  class { 'repo::ubuntucloud::setup':
    stage    => 'setup',
  }
}


class repo::ubuntucloud::setup() {
  include ccgcommon

  $release = $::majdistrelease

  apt::source { 'ubuntu-cloud':
    location          =>  'http://ubuntu-cloud.archive.canonical.com/ubuntu',
    repos             =>  'main',
    release           =>  'precise-updates/grizzly',
    include_src       =>  false,
    required_packages =>  'ubuntu-cloud-keyring',
  }

}
