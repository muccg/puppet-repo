#
class repo () {
  include repo::packages

  case $::osfamily {
    'Ubuntu', 'Debian' : {
      class { 'apt':
        always_apt_update => true,
        stage             => 'setup'
      }
    }
  }
}
