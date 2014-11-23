#
class repo (
  $proxy_host = false,
  $proxy_port = '3128',
  ) {
  include stdlib

  case $::osfamily {

    'Ubuntu', 'Debian' : {
      class { 'apt':
        proxy_host => $proxy_host,
        proxy_port => $proxy_port,
        stage      => 'setup'
      }
      include apt::unattended_upgrades
      class { 'apt::update':
        stage => 'setup',
      }
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

      $yum_options = {
        proxy => "http://${proxy_host}:${proxy_port}",
      }

      class { 'yum':
        extrarepo   => 'epel',
        template    => 'repo/yum.conf.erb',
        update      => 'cron',
        options     => $yum_options,
        cron_param  => $cron_options,
        cron_mailto => 'root@localhost',
        stage       => setup,
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
