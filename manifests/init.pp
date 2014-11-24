#
class repo (
  $proxy_host = false,
  $proxy_port = '3128',
  ) {

  class { 'repo::setup':
    proxy_host => $proxy_host,
    proxy_port => $proxy_port,
    stage      => 'setup',
  }
}

class repo::setup (
  $proxy_host = false,
  $proxy_port = '3128',
  ) {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      class { 'apt':
        proxy_host => $proxy_host,
        proxy_port => $proxy_port,
      }
      include apt::unattended_upgrades
    }

    'RedHat', 'CentOS' : {
      case $::majdistrelease {
        '5' : {
          $cron_options = "--disablerepo=ccg*"
        }
        default: {
          $cron_options = "--disablerepo=ccg* --security"
        }
      }

      if ($proxy_host) {
        $yum_options = {
          proxy => "http://${proxy_host}:${proxy_port}",
        }
      } else {
        $yum_options = {}
      }

      class { 'yum':
        extrarepo   => 'epel',
        template    => 'repo/yum.conf.erb',
        update      => 'cron',
        options     => $yum_options,
        cron_param  => $cron_options,
        cron_mailto => 'root@localhost',
        clean_repos => true,
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
