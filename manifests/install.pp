# == Class: al_agents::install
class al_agents::install inherits al_agents {

  $package_path = '/tmp/al-agent'
  $pkg_url = $al_agents::al_agent_package

  exec {'download':
    command => "/usr/bin/wget -O ${package_path} ${pkg_url}"
  }

  case $::operatingsystem {
    'centos', 'redhat', 'fedora': {
      $provider = 'rpm'
    }
    'debian', 'ubuntu': {
      $provider = 'dpkg'
    }
    default: {
      fail("Module al_agents is not supported on ${::operatingsystem}")
    }
  }

  package {'al-agent':
    ensure   => installed,
    name     => $al_agents::al_agent_service,
    provider => $provider,
    source   => $package_path,
  }

}