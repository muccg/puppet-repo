#
class repo::nginx() {
  include stdlib

  apt::key { 'nginx':
    key        => '7BD9BF62',
    key_source => 'http://nginx.org/keys/nginx_signing.key',
  }

  apt::source{'nginx':
    location    => 'http://nginx.org/packages/ubuntu/',
    repos       => 'nginx',
    include_src => false,
  }

}
