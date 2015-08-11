#
class repo::ubuntucloud() {
  include stdlib

  $release = $::majdistrelease

  apt::source { 'ubuntu-cloud':
    location          =>  'http://ubuntu-cloud.archive.canonical.com/ubuntu',
    repos             =>  'main',
    release           =>  'precise-updates/grizzly',
    include_src       =>  false,
    required_packages =>  'ubuntu-cloud-keyring',
  }

}
