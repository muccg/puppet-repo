#
class repo::elgis($priority='20') {
  include stdlib

  $url = $::majdistrelease ? {
    '5' => 'http://elgis.argeo.org/repos/5/elgis-release-5-5_0.noarch.rpm',
    default => 'http://elgis.argeo.org/repos/6/elgis-release-6-6_0.noarch.rpm'
  }

  package {'elgis-release':
    ensure   => installed,
    alias    => 'elgis',
    provider => 'rpm',
    source   => $url
  }

  # TODO FIXME This breaks elgis for reasons that escape me
  #yumrepo {'elgis': priority => $priority, require => Package['elgis-release'] }
}
