# @name :
# @desc :
# @info :
# [logstash-1.3]
# name=logstash repository for 1.3.x packages
# baseurl=http://packages.elasticsearch.org/logstash/1.3/centos
# gpgcheck=1
# gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
# enabled=1
class repo::logstash($priority='20') {
  include stdlib

  class { 'repo::logstash::setup':
    stage    => 'setup',
    priority => $priority,
  }
}


class repo::logstash::setup($priority='20') {

  yumrepo {'logstash':
    mirrorlist     => 'absent',
    baseurl        => 'http://packages.elasticsearch.org/logstash/1.3/centos',
    enabled        => 1,
    gpgcheck       => 1,
    gpgkey         => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
    priority       => $priority,
  }
}
