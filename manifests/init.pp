#
class repo (
  $proxy_host = false,
  $proxy_port = '3128',
  ) {
  include repo::packages

  case $::osfamily {
    'Ubuntu', 'Debian' : {
      class { 'apt':
        proxy_host => $proxy_host,
        proxy_port => $proxy_port,
        stage      => 'setup'
      }
    }
  }
}


class repo::sydney {
  class { '::repo':
    proxy_host => 'ccg-syd-nginx-staging.ec2.ccgapps.com.au',
    proxy_port => 3128,
  }
}
