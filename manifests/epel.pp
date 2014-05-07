#
class repo::epel() {
  include stdlib

  class { '::epel':
    stage    => 'setup',
  }
}
